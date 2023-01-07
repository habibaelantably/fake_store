import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final Widget? widget;
  final IconData? prefix;
  final IconData? suffix;

  final TextEditingController controller;

  final String validateText;

  final bool isPassword;

  final double? borderRadius;

  final TextInputType inputType;

  final String? hintText;
  final TextAlign textAlign;
  final Color? borderColor;
  final int? maxLines;
  final Color? fillColor;

  final Function()? suffixPressed;
  final Function()? onTap;
  final void Function(String)? onChanged;
  final bool hasBorder;



  const DefaultFormField({
    Key? key,
    this.borderRadius,
    this.borderColor=AppColor.appDefaultColor,
    required this.controller,
    required this.validateText,
    required this.maxLines,
    this.suffixPressed,
    this.onTap,
    this.onChanged,
    this.isPassword = false,
    required this.inputType,
    this.hintText,
    this.prefix,
    this.suffix,
    this.textAlign = TextAlign.start,
    this.widget,
    this.fillColor,
    required this.hasBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      onChanged: onChanged,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return validateText;
        }
        return null;
      },
      obscureText: isPassword,
      keyboardType: inputType,
      textAlign: textAlign,
      onTap: onTap ?? (){},
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
            color: Colors.grey[400],
          ),
        ),
        prefixIcon: widget ,
        hintText: hintText ,
        labelStyle:
        const TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey[700]),
        enabledBorder:   hasBorder ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: const BorderSide(
            color: AppColor.appDefaultColor,
            width: 0.8,
          ),
        ) : OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius!),
        ) ,
        errorBorder: hasBorder ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: const BorderSide(
            color: AppColor.appDefaultColor,
            width: 0.8,
          ),
        ) : OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        focusedBorder:   hasBorder ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: const BorderSide(
            color: AppColor.appDefaultColor,
            width: 0.8,
          ),
        ) : OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius!),
        ) ,
        focusedErrorBorder:hasBorder ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: const BorderSide(
            color: AppColor.appDefaultColor,
            width: 0.8,
          ),
        ) : OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius!),
        )  ,
        errorStyle: const TextStyle(
            color: Colors.red
        ),
        fillColor:fillColor,
        filled: true,
      ),
      cursorColor: AppColor.appDefaultColor,
      style: const TextStyle(color: Colors.black),
    );
  }
}