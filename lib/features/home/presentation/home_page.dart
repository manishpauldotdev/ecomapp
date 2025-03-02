import 'package:ecomapp/core/styles/app_colors.dart';
import 'package:ecomapp/core/styles/app_text_styles.dart';
import 'package:ecomapp/features/home/presentation/widget/product_item.dart';
import 'package:ecomapp/features/home/shared/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    final homeNotifier = ref.read(homeNotifierProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeNotifier.getAllProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeNotifierProvider);
    // final stateNotifier = ref.read(homeNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        backgroundColor: AppColors.actionTextColor,
        title: Text(
          'Products',
          style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
            fontSize: 18.sp,
            color: AppColors.colorWhite,
          ),
        ),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.shopping_cart, color: AppColors.colorWhite),
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Text(
              'Latest Collection',
              style: AppTextStyles.textStylePoppinsSemiBold.copyWith(fontSize: 24.sp),
            ),
            20.verticalSpace,
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),

                itemCount: state.products?.length,
                itemBuilder: (ctx, index) {
                  final product = state.products?[index];

                  return ProductItem(product: product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
