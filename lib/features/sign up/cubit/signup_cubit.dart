import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  SignUpCubit() : super(SignUpInitial());

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(SignUpLoading());

    // Validate passwords match
    if (password != confirmPassword) {
      emit(SignUpFailure("Passwords do not match"));
      return;
    }

    try {
      // Create user with Firebase Auth
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.sendEmailVerification();

      // Update user profile with firstName and lastName
      await userCredential.user?.updateDisplayName("$firstName $lastName");

      emit(SignUpSuccess(userCredential.user!));
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailure(e.message ?? "An error occurred during sign-up"));
    }
  }
}
