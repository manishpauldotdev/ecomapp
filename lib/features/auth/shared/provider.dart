import 'package:ecomapp/core/providers/providers.dart';
import 'package:ecomapp/features/auth/application/auth_notifier.dart';
import 'package:ecomapp/features/auth/application/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(hiveProvider));
});
