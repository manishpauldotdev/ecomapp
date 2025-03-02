import 'package:ecomapp/core/styles/app_colors.dart';
import 'package:ecomapp/core/styles/app_text_styles.dart';
import 'package:ecomapp/features/home/presentation/widget/product_item.dart';
import 'package:ecomapp/features/home/shared/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeNotifierProvider);
    // final stateNotifier = ref.read(homeNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        backgroundColor: AppColors.actionTextColor,
        title: Text(
          'Favorites',
          style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
            fontSize: 18.sp,
            color: AppColors.colorWhite,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 20.verticalSpace,
            // Text(
            //   'Latest Collection',
            //   style: AppTextStyles.textStylePoppinsSemiBold.copyWith(fontSize: 24.sp),
            // ),
            20.verticalSpace,
            if (state.favoriteItems?.isEmpty ?? false) ...[
              Center(
                child: Text(
                  'No items added',
                  style: AppTextStyles.textStylePoppinsSemiBold.copyWith(fontSize: 18.sp),
                ),
              ),
            ] else ...[
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),

                  itemCount: state.favoriteItems?.length,
                  itemBuilder: (ctx, index) {
                    final product = state.favoriteItems?[index];

                    return ProductItem(product: product);
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
