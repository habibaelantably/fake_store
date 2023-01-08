import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:flutter/material.dart';


class RegularText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final double lineHeight;
  final bool isLineThrow;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final FontFamilyType fontFamilyType;

  const RegularText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize = 16,
    this.maxLines,
    this.overflow,
    this.fontFamilyType = FontFamilyType.abel,
    this.textAlign,
    this.lineHeight = 1,
    this.isLineThrow = false,
    this.fontWeight ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? AppColor.white,
        fontFamily: fontFamilyType.fontFamilyString(),
        fontWeight: fontWeight,
        fontSize: fontSize,
        overflow: overflow,
        decoration: isLineThrow == false
            ? TextDecoration.none
            : TextDecoration.lineThrough,
        height: lineHeight,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}

enum FontFamilyType { abel, inriaSerif, kufam, actor, readexPro, mulish, inter,poppins}

extension FontFamilyTypeExtension on FontFamilyType {
  String fontFamilyString() {
    switch (this) {
      case FontFamilyType.abel:
        return 'Abel';
      case FontFamilyType.inriaSerif:
        return 'Inria Serif';
      case FontFamilyType.kufam:
        return 'Kufam';
      case FontFamilyType.actor:
        return 'Actor';
      case FontFamilyType.readexPro:
        return 'Readex Pro';
      case FontFamilyType.mulish:
        return 'Mulish';
      case FontFamilyType.inter:
        return 'Inter';
      case FontFamilyType.poppins:
        return 'Poppins';
    }
  }
}
