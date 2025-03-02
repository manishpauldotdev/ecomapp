import 'dart:convert';

import 'package:ecomapp/core/constants/products.dart';
import 'package:ecomapp/core/utils/app_log.dart';
import 'package:ecomapp/core/utils/toast.dart';
import 'package:ecomapp/features/home/application/home_state.dart';
import 'package:ecomapp/features/home/domain/products_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState());

  void getAllProducts() {
    state = state.copyWith(isLoading: true);

    try {
      final productsModel = productsModelFromJson(jsonEncode(products));

      state = state.copyWith(products: productsModel.products, isLoading: false);
    } catch (e) {
      AppLog.log(e.toString());
      showToastMessage('Something went wrong. Please try again.');
      state = state.copyWith(isLoading: false);
    }
  }

  void addProductsToFavorite(Product product) {
    final addedProducts = <Product>[...state.favoriteItems ?? []];

    if (addedProducts.contains(product)) {
      addedProducts.remove(product);
    } else {
      addedProducts.add(product);
    }

    state = state.copyWith(favoriteItems: addedProducts);
  }

  void addProductsToCart(Product product) {
    final addedProducts = <Product>[...state.addedItemsToCart ?? []];

    if (addedProducts.contains(product)) {
      addedProducts.remove(product);
    } else {
      addedProducts.add(product);
    }

    state = state.copyWith(addedItemsToCart: addedProducts);
  }

  double get calculateTotalAmount {
    final addedProducts = <Product>[...state.addedItemsToCart ?? []];
    double amount = 0.0;

    for (Product product in addedProducts) {
      amount += product.price ?? 0.0;
    }

    return double.parse(amount.toStringAsFixed(2));
  }

  void removeAddedItems() {
    state = state.copyWith(addedItemsToCart: []);
  }
}
