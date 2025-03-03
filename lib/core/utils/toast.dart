import 'package:ecomapp/core/styles/app_colors.dart';
import 'package:ecomapp/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

Future<void> showToastMessage(String message, {String errorMessage = ''}) async {
  showToast(
    message,
    position: ToastPosition.bottom,
    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
    duration: const Duration(seconds: 4),
    textPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30).r,
    backgroundColor: AppColors.colorBlack,
    textStyle: AppTextStyles.textStylePoppinsMedium.copyWith(
      fontSize: 14.sp,
      color: AppColors.colorWhite,
    ),
  );
}

Future<void> showConnectionWasInterruptedToastMessage() async {
  await showToastMessage('Connection Was Interrupted');
}
