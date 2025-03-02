import 'package:ecomapp/features/base/application/base_notifier.dart';
import 'package:ecomapp/features/base/application/base_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final baseNotifierProvider = StateNotifierProvider<BaseNotifier, BaseState>((ref) {
  return BaseNotifier();
});
