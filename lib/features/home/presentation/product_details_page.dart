import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomapp/core/styles/app_colors.dart';
import 'package:ecomapp/core/styles/app_text_styles.dart';
import 'package:ecomapp/features/home/domain/products_model.dart';
import 'package:ecomapp/features/home/shared/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsPage extends ConsumerWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeNotifierProvider);
    final stateNotifier = ref.read(homeNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios, color: AppColors.colorWhite, size: 22),
        ),
        backgroundColor: AppColors.actionTextColor,
        title: Text(
          'Products Details',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            SizedBox(
              width: double.maxFinite,
              height: 220.h,
              child: CachedNetworkImage(imageUrl: product.images?.first ?? '', fit: BoxFit.cover),
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '₹',
                      style: AppTextStyles.textStylePoppinsMedium.copyWith(fontSize: 16.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    6.horizontalSpace,
                    Text(
                      product.price.toString(),
                      style: AppTextStyles.textStylePoppinsMedium.copyWith(fontSize: 16.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    stateNotifier.addProductsToCart(product);
                  },
                  child: Container(
                    width: 84,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.actionTextColor,
                      borderRadius: BorderRadius.circular(8).r,
                    ),
                    child: Icon(
                      state.addedItemsToCart?.contains(product) ?? false
                          ? Icons.remove_shopping_cart
                          : Icons.add_shopping_cart,
                      color: AppColors.colorWhite,
                    ),
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            Text(
              product.name ?? '',
              style: AppTextStyles.textStylePoppinsSemiBold.copyWith(fontSize: 16.sp),
            ),
            20.verticalSpace,
            Text(
              product.longDesc ?? '',
              style: AppTextStyles.textStylePoppinsRegular.copyWith(fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
