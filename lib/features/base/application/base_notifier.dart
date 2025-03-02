import 'package:ecomapp/features/base/application/base_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseNotifier extends StateNotifier<BaseState> {
  BaseNotifier() : super(BaseState());

  void navigate(int index) {
    state = state.copyWith(pageIndex: index);
  }
}
