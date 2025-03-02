import 'package:ecomapp/core/constants/assets.dart';
import 'package:ecomapp/core/styles/app_colors.dart';
import 'package:ecomapp/core/styles/app_text_styles.dart';
import 'package:ecomapp/features/auth/shared/provider.dart';
import 'package:ecomapp/widgets/app_button.dart';
import 'package:ecomapp/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.read(authNotifierProvider);
    final stateNotifier = ref.read(authNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SvgPicture.asset(Assets.signupHeader, width: 320.sp)],
                ),
                Text(
                  'Sign up',
                  style: AppTextStyles.textStylePoppinsBold.copyWith(fontSize: 36.sp),
                ),
                20.verticalSpace,
                // AppTextField(
                //   hintText: 'Enter Name',
                //   controller: stateNotifier.signupNameController,
                // ),
                // 10.verticalSpace,
                AppTextField(
                  hintText: 'Enter Email',
                  controller: stateNotifier.signupEmailController,
                ),
                10.verticalSpace,
                AppTextField(
                  hintText: 'Enter Password',
                  controller: stateNotifier.signupPasswordController,
                  isPassword: true,
                ),
                120.verticalSpace,
                AppButton(
                  isLoading: state.isLoading,
                  borderRadius: 12.r,
                  color: AppColors.actionTextColor,
                  text: 'Sign up',
                  onTap: () {
                    if (stateNotifier.isSignupFieldsValidated) {
                      stateNotifier.signup(
                        onSuccess: () {
                          stateNotifier.clearAllFields();
                          context.pop();
                        },
                      );
                    }
                  },
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Registered?',
                      style: AppTextStyles.textStylePoppinsSemiBold.copyWith(fontSize: 16.sp),
                    ),
                    4.horizontalSpace,
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Text(
                        'Login',
                        style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
                          fontSize: 16.sp,
                          color: AppColors.actionTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                60.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
