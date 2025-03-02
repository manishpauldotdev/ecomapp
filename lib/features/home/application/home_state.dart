import 'package:ecomapp/features/home/domain/products_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default([]) List<Product>? products,
    @Default(0) int addedItemsCount,
    @Default([]) List<Product>? addedItemsToCart,
    @Default([]) List<Product>? favoriteItems,
    @Default(0) double totalAmount,
  }) = _HomeState;

  const HomeState._();
}
