import 'package:ecomapp/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppTextField extends StatefulWidget {
  final String? hintText;
  final String? prefixIconPath;
  final TextInputType? keyboardType;
  final bool? isPhoneNumber;
  final TextEditingController? controller;
  final bool? isPassword;

  const AppTextField({
    super.key,
    this.hintText,
    this.prefixIconPath,
    this.keyboardType,
    this.isPhoneNumber = false,
    this.controller,
    this.isPassword,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: widget.controller,
      obscureText: widget.isPassword ?? false,
      keyboardType: widget.keyboardType,
      inputFormatters:
          (widget.isPhoneNumber ?? false) ? [LengthLimitingTextInputFormatter(10)] : [],
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon:
            widget.prefixIconPath != null
                ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
                  child: SvgPicture.asset(widget.prefixIconPath!),
                )
                : null,
        prefixIconConstraints: BoxConstraints(maxHeight: 36).r,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12).r),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12).r),
      ),
    );
  }
}
