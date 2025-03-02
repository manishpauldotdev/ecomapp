import 'package:ecomapp/core/styles/app_colors.dart';
import 'package:ecomapp/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final double? borderRadius;
  final BoxBorder? boxBorder;
  final Function()? onTap;
  final String? text;
  final bool? isLoading;

  const AppButton({
    super.key,
    this.width = double.maxFinite,
    this.height = 50.0,
    this.color = AppColors.colorBlack,
    this.borderRadius = 100,
    this.boxBorder,
    this.onTap,
    this.text,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius!),
          border: boxBorder,
        ),
        child: Center(
          child:
              isLoading ?? false
                  ? CircularProgressIndicator(color: AppColors.colorWhite)
                  : Text(
                    text ?? '',
                    style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.colorWhite,
                    ),
                  ),
        ),
      ),
    );
  }
}
