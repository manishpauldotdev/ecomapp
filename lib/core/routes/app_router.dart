import 'package:ecomapp/features/auth/presentation/login_page.dart';
import 'package:ecomapp/features/auth/presentation/signup_page.dart';
import 'package:ecomapp/features/base/presentation/base_page.dart';
import 'package:ecomapp/features/home/domain/products_model.dart';
import 'package:ecomapp/features/home/presentation/checkout_page.dart';
import 'package:ecomapp/features/home/presentation/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { login, signup, base, home, productDetails, checkout }

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.login.name,
      pageBuilder: (context, state) {
        return MaterialPage(child: LoginPage());
      },
    ),
    GoRoute(
      path: '/signup',
      name: AppRoute.signup.name,
      pageBuilder: (context, state) {
        return MaterialPage(child: SignupPage());
      },
    ),
    GoRoute(
      path: '/base',
      name: AppRoute.base.name,
      pageBuilder: (context, state) {
        return MaterialPage(child: BasePage());
      },
    ),
    GoRoute(
      path: '/product-details',
      name: AppRoute.productDetails.name,
      pageBuilder: (context, state) {
        final product = state.extra as Product?;
        return MaterialPage(child: ProductDetailsPage(product: product!));
      },
    ),
    GoRoute(
      path: '/checkout',
      name: AppRoute.checkout.name,
      pageBuilder: (context, state) {
        return MaterialPage(child: CheckoutPage());
      },
    ),
    // GoRoute(
    //   path: '/home',
    //   name: AppRoute.home.name,
    //   pageBuilder: (context, state) {
    //     return MaterialPage(child: HomePage());
    //   },
    // ),
  ],
);
