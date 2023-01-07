
import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget
{
  const DefaultButton({
    Key? key,
    this.width,
    this.height,
    this.background,
    this.radius,
    required this.isUpperCase,
    required this.text,
    required this.function,

  }) : super(key: key);
  final double? width;
  final double? height;
  final Color? background ;
  final double? radius ;
  final bool isUpperCase ;
  final Function function;
  final String text;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        color: background ?? AppColor.appDefaultColor,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: FittedBox(
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: const TextStyle(
                fontFamily: 'Din',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }

}