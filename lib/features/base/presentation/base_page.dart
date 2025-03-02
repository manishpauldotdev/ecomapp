import 'package:ecomapp/core/styles/app_colors.dart';
import 'package:ecomapp/features/base/shared/provider.dart';
import 'package:ecomapp/features/home/presentation/cart_page.dart';
import 'package:ecomapp/features/home/presentation/favorite_page.dart';
import 'package:ecomapp/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasePage extends ConsumerStatefulWidget {
  const BasePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BasePageState();
}

class _BasePageState extends ConsumerState<BasePage> {
  final navigationPages = [HomePage(), FavoritePage(), CartPage()];
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(baseNotifierProvider);
    final stateNotifier = ref.read(baseNotifierProvider.notifier);

    return Scaffold(
      body: navigationPages[state.pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.colorBlack,
        currentIndex: state.pageIndex,
        onTap: (index) {
          stateNotifier.navigate(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(state.pageIndex == 0 ? Icons.home : Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(state.pageIndex == 1 ? Icons.favorite : Icons.favorite_border),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(state.pageIndex == 2 ? Icons.shopping_cart : Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
