import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomapp/core/routes/app_router.dart';
import 'package:ecomapp/core/styles/app_colors.dart';
import 'package:ecomapp/core/styles/app_text_styles.dart';
import 'package:ecomapp/features/home/domain/products_model.dart';
import 'package:ecomapp/features/home/shared/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductItem extends ConsumerWidget {
  final Product? product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(homeNotifierProvider);
    final stateNotifier = ref.read(homeNotifierProvider.notifier);

    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoute.productDetails.name, extra: product);
      },
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12).r,
                    border: Border.all(width: 1, color: AppColors.colorBlack),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12).r,
                    child: CachedNetworkImage(
                      imageUrl: product?.images?.first ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                    onTap: () {
                      if (product != null) {
                        stateNotifier.addProductsToFavorite(product!);
                      }
                    },
                    child:
                        state.favoriteItems?.contains(product) ?? false
                            ? Icon(Icons.favorite, color: AppColors.colorRed)
                            : Icon(Icons.favorite_border, color: AppColors.colorWhite),
                  ),
                ),
              ],
            ),
          ),
          6.verticalSpace,
          Text(
            product?.name ?? '',
            style: AppTextStyles.textStylePoppinsMedium.copyWith(fontSize: 16.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          4.verticalSpace,
          Row(
            children: [
              Text(
                '₹',
                style: AppTextStyles.textStylePoppinsMedium.copyWith(fontSize: 16.sp),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              6.horizontalSpace,
              Text(
                product?.price.toString() ?? '',
                style: AppTextStyles.textStylePoppinsMedium.copyWith(fontSize: 16.sp),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
