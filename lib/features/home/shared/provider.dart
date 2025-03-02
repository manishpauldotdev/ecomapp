import 'package:ecomapp/features/home/application/home_notifier.dart';
import 'package:ecomapp/features/home/application/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeNotifierProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});
