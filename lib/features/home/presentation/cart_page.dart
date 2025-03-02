import 'package:ecomapp/core/routes/app_router.dart';
import 'package:ecomapp/core/styles/app_colors.dart';
import 'package:ecomapp/core/styles/app_text_styles.dart';
import 'package:ecomapp/core/utils/size.dart';
import 'package:ecomapp/features/home/presentation/widget/product_item.dart';
import 'package:ecomapp/features/home/shared/provider.dart';
import 'package:ecomapp/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeNotifierProvider);
    // final stateNotifier = ref.read(homeNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        backgroundColor: AppColors.actionTextColor,
        title: Text(
          'Cart',
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
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),

                  itemCount: state.addedItemsToCart?.length,
                  itemBuilder: (ctx, index) {
                    final product = state.addedItemsToCart?[index];

                    return ProductItem(product: product);
                  },
                ),
              ),
              Center(
                child: AppButton(
                  width: context.deviceWidth * 0.6,
                  text: 'Checkout',
                  onTap: () => context.pushNamed(AppRoute.checkout.name),
                ),
              ),
              20.verticalSpace,
            ],
          ],
        ),
      ),
    );
  }
}
