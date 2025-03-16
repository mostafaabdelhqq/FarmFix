import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> resetPassword(String email) async {
    emit(ResetPasswordLoading());
    try {
      final methods = await _auth.fetchSignInMethodsForEmail(email);
      if (methods.isEmpty) {
        emit(ResetPasswordEmailNotFound(
            ' Eamil address does not exist. Please SignUp.'));
      } else {
        await _auth.sendPasswordResetEmail(email: email);
        emit(ResetPasswordSuccess());
      }
    } on FirebaseAuthException catch (e) {
      emit(ResetPasswordFailure(e.message ?? 'An unexpected error occurred.'));
    } catch (e) {
      emit(ResetPasswordFailure('An unexpected error occurred.'));
    }
  }
}
