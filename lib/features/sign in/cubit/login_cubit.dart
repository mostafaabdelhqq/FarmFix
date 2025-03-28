import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginCubit() : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if email is verified
      if (userCredential.user!.emailVerified) {
        emit(LoginSuccess(userCredential.user!));
      } else {
        await _auth.signOut(); // Sign out the user if email is not verified
        emit(LoginFailure("Please verify your email before logging in."));
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(e.message ?? "An error occurred"));
    }
  }
}
