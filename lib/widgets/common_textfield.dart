import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:triya_app/constants/color_constant.dart';
import 'package:triya_app/constants/text_style.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefix;
  final FormFieldValidator<String>? validator;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool isEnable;
  final bool enableInteractiveSelection;
  final List<TextInputFormatter>? inputFormat;

  const CommonTextField({
    Key? key,
    required this.controller,
    this.prefix,
    this.validator,
    this.textInputType,
    this.textInputAction,
    this.inputFormat,
    this.isEnable = true,
    this.enableInteractiveSelection = true,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: enableInteractiveSelection,
      enabled: isEnable,
      cursorColor: ColorConstant.black,
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormat,
      style: TextStyleRes.body2.copyWith(color: ColorConstant.black),
      keyboardType: textInputType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(
          errorMaxLines: 2,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusColor: ColorConstant.black,
          hintText: hintText,
          prefixIcon: prefix,
          prefixIconConstraints: const BoxConstraints(
              maxHeight: 30, minHeight: 30, maxWidth: 30, minWidth: 30),
          hintStyle: TextStyleRes.body2.copyWith(color: ColorConstant.grey)),
    );
  }
}
