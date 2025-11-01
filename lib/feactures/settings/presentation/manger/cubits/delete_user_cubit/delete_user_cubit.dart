import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'delete_user_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  DeleteUserCubit() : super(DeleteUserInitial());

  final supabase = Supabase.instance.client;

  Future<void> deleteAccount() async {
    emit(DeleteUserLoading());

    try {
      final user = supabase.auth.currentUser;
      await supabase.functions.invoke(
        'delete_user',
        body: {'user_id': user?.id},
      );
      await supabase.auth.signOut();

      emit(DeleteUserSuccess());
    } catch (e) {
      emit(DeleteUserFaluire(errorMessage: e.toString()));
      print(e.toString());
    }
  }
}
