import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomapp/core/routes/app_router.dart';
import 'package:ecomapp/core/styles/app_colors.dart';
import 'package:ecomapp/core/styles/app_text_styles.dart';
import 'package:ecomapp/core/utils/size.dart';
import 'package:ecomapp/features/home/shared/provider.dart';
import 'package:ecomapp/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CheckoutPage extends ConsumerStatefulWidget {
  const CheckoutPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends ConsumerState<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
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
          'Checkout',
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
            20.verticalSpace,
            if (state.addedItemsToCart?.isEmpty ?? false) ...[
              Center(
                child: Text(
                  'No items added',
                  style: AppTextStyles.textStylePoppinsSemiBold.copyWith(fontSize: 18.sp),
                ),
              ),
            ] else ...[
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (cntx, index) => 10.verticalSpace,
                  itemCount: state.addedItemsToCart?.length ?? 0,
                  itemBuilder: (ctx, index) {
                    final product = state.addedItemsToCart?[index];

                    return Container(
                      padding: const EdgeInsets.all(12),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.colorBlack),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8).r,
                            child: CachedNetworkImage(
                              imageUrl: product?.images?.first ?? '',
                              width: 90,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          8.horizontalSpace,
                          SizedBox(
                            width: 170.w,
                            child: Text(
                              product?.name ?? '',
                              style: AppTextStyles.textStylePoppinsMedium.copyWith(fontSize: 16.sp),
                            ),
                          ),
                          4.horizontalSpace,
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '₹',
                                style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                  fontSize: 16.sp,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              6.horizontalSpace,
                              Text(
                                product?.price.toString() ?? '',
                                style: AppTextStyles.textStylePoppinsMedium.copyWith(
                                  fontSize: 16.sp,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: AppButton(
                  width: context.deviceWidth * 0.6,
                  text: 'Pay ₹${stateNotifier.calculateTotalAmount}',
                  onTap: () {
                    stateNotifier.removeAddedItems();
                    context.goNamed(AppRoute.base.name);
                  },
                ),
              ),
              60.verticalSpace,
            ],
          ],
        ),
      ),
    );
  }
}
