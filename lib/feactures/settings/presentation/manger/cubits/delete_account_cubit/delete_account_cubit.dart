import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/widget/custom_show_snackbar.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit() : super(DeleteAccountInitial());
  Future<void> deleteAccount(BuildContext context) async {
    emit(DeleteAccountLoading());
    try {
      final supabase = Supabase.instance.client;
      final userId = supabase.auth.currentUser?.id;

      await supabase.from('profiles').delete().eq('id', userId!);

      emit(DeleteAccountSuccess());
    } catch (e) {
      emit(DeleteAccountFaluire(errorMassage: e.toString()));
      customShowSnackBar(context, title: e.toString());
    }
  }
}
