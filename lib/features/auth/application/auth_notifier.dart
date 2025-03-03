import 'package:ecomapp/core/infrastructure/hive_database.dart';
import 'package:ecomapp/core/utils/app_log.dart';
import 'package:ecomapp/core/utils/toast.dart';
import 'package:ecomapp/core/utils/validator.dart';
import 'package:ecomapp/features/auth/application/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._hiveDatabase) : super(AuthState());

  final HiveDatabase _hiveDatabase;

  final signupEmailController = TextEditingController();
  final signupPasswordController = TextEditingController();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    signupEmailController.dispose();
    signupPasswordController.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
  }

  bool get isSignupFieldsValidated {
    if (signupEmailController.text.trim().isEmpty) {
      showToastMessage('Please enter your email');
      return false;
    } else if (!Validator.validateEmail(signupEmailController.text)) {
      showToastMessage('Please enter a valid email');
      return false;
    } else if (signupPasswordController.text.trim().isEmpty) {
      showToastMessage('Please enter a password');
      return false;
    } else if (signupPasswordController.text.length < 8) {
      showToastMessage('Password must be at least 8 characters long');
      return false;
    } else {
      return true;
    }
  }

  bool get isLoginFieldsValidated {
    if (loginEmailController.text.trim().isEmpty) {
      showToastMessage('Please enter your email');
      return false;
    } else if (!Validator.validateEmail(loginEmailController.text)) {
      showToastMessage('Please enter a valid email');
      return false;
    } else if (loginPasswordController.text.trim().isEmpty) {
      showToastMessage('Please enter a password');
      return false;
    } else if (loginPasswordController.text.length < 8) {
      showToastMessage('Password must be at least 8 characters long');
      return false;
    } else {
      return true;
    }
  }

  void clearAllFields() {
    signupEmailController.clear();
    signupPasswordController.clear();
    loginEmailController.clear();
    loginPasswordController.clear();
  }

  Future<void> signup({required VoidCallback onSuccess}) async {
    try {
      state = state.copyWith(isLoading: true);

      final credentials = await _auth.createUserWithEmailAndPassword(
        email: signupEmailController.text,
        password: signupPasswordController.text,
      );

      if (credentials.user != null) {
        showToastMessage('Account created successfully');

        onSuccess.call();

        state = state.copyWith(isLoading: false);
      } else {
        state = state.copyWith(isLoading: false);
        showToastMessage('Something went wrong. Please try again.');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      AppLog.log(e.toString());
      showToastMessage('Something went wrong. Please try again.');
    }
  }

  Future<void> login({required VoidCallback onSuccess}) async {
    try {
      state = state.copyWith(isLoading: true);

      final credentials = await _auth.signInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      );

      if (credentials.user != null) {
        showToastMessage('Login successful');

        _hiveDatabase.box.put(AppPreferenceKeys.uid, credentials.user?.uid);

        onSuccess.call();

        state = state.copyWith(isLoading: false);
      } else {
        state = state.copyWith(isLoading: false);
        showToastMessage('Something went wrong. Please try again.');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      AppLog.log(e.toString());
      showToastMessage('Something went wrong. Please try again.');
    }
  }

  Future<void> signout() async {
    try {
      _auth.signOut();
    } catch (e) {
      AppLog.log(e.toString());
      showToastMessage('Something went wrong. Please try again.');
    }
  }
}
