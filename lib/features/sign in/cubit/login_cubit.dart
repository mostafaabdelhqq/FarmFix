import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginCubit() : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());

    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.reload();
      final user = userCredential.user;

      if (user != null && user.emailVerified) {
        // حفظ حالة تسجيل الدخول
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);

        emit(LoginSuccess(user));
      } else {
        await _auth.signOut();
        emit(LoginFailure("Please verify your email before logging in."));
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(e.message ?? "An error occurred"));
    }
  }

  /// تسجيل الخروج + إزالة حالة isLoggedIn
  Future<void> logout() async {
    await _auth.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    emit(LoginInitial());
  }

  /// التحقق مما إذا كان المستخدم لا يزال مسجل الدخول
  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final user = _auth.currentUser;

    if (isLoggedIn && user != null && user.emailVerified) {
      emit(LoginSuccess(user));
    } else {
      emit(LoginInitial());
    }
  }
}
