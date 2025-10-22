import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit() : super(DeleteAccountInitial());

  final supabase = Supabase.instance.client;

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoading());

    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        emit(DeleteAccountFaluire(errorMessage: 'No user logged in'));
        return;
      }

      final response = await supabase.functions.invoke(
        'delete_user',
        body: {'userId': user.id},
      );

      if (response.status == 200) {
        await supabase.auth.signOut();
        emit(DeleteAccountSuccess());
      } else {
        emit(DeleteAccountFaluire(errorMessage: response.data.toString()));
      }
    } catch (e) {
      emit(DeleteAccountFaluire(errorMessage: e.toString()));
      print(e.toString());
    }
  }
}
