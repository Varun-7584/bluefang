import 'package:bluefang/package/bluefang_ui/src/shared/app_colors.dart';
import 'package:bluefang/package/bluefang_ui/src/shared/text_styles.dart';
import 'package:flutter/material.dart';

/// Creates a text widget with the selected style and text.
/// 
/// BFText.[headingOne] displays the text as [kcPrimaryColor] and medium. 
/// 
/// BFText.[headingTwo] displays the text as [kcPrimaryColor] and bold.
/// 
/// BFText.[headingThree] displays the text as [kcPrimaryColor] and semi-bold.
/// 
/// BFText.[headingFour] displays the text as [kcPrimaryColor] and normal.
/// 
/// BFText.[headingFive] displays the text as [kcPrimaryColor] and light
/// 
/// BFText.[subheading] displays the text as black and semi-bold.
/// 
/// BFText.[caption] displays the text as [kcMediumGreyColor] and normal. 
/// 
/// BFText.[body] displays the text as [kcMediumGreyColor] and medium. 
class BFText extends StatelessWidget {
  final String text;
  final TextStyle style;

  BFText.headingOne(this.text,
      {Color color = kcPrimaryColor, FontWeight fontWeight = FontWeight.w500, double fontSize = 24})
      : style = heading1Style.copyWith(color: color, fontWeight: fontWeight, fontSize: fontSize);

  BFText.headingTwo(this.text,
      {Color color = kcPrimaryColor, FontWeight fontWeight = FontWeight.w700})
      : style = heading2Style.copyWith(color: color, fontWeight: fontWeight);

  BFText.headingThree(this.text,
      {Color color = kcPrimaryColor, FontWeight fontWeight = FontWeight.w600, double fontSize = 20})
      : style = heading3Style.copyWith(color: color, fontWeight: fontWeight, fontSize: fontSize);

  BFText.headingFour(this.text,
      {Color color = kcPrimaryColor, FontWeight fontWeight = FontWeight.w400})
      : style = heading4Style.copyWith(color: color, fontWeight: fontWeight);

  BFText.headingFive(this.text,
      {Color color = kcPrimaryColor, FontWeight fontWeight = FontWeight.w300, double fontSize = 16})
      : style = heading5Style.copyWith(color: color, fontWeight: fontWeight, fontSize: fontSize);

  BFText.subHeading(this.text,
      {Color color = kcBlack, FontWeight fontWeight = FontWeight.w600, double fontSize = 24})
      : style = subHeadingStyle.copyWith(color: color, fontWeight: fontWeight, fontSize: fontSize);

  BFText.caption(this.text,
      {Color color = kcMediumGreyColor,
      FontWeight fontWeight = FontWeight.w400,
      FontStyle fontStyle = FontStyle.normal, double fontSize = 12})
      : style = captionStyle.copyWith(
            color: color, fontWeight: fontWeight, fontStyle: fontStyle, fontSize: fontSize);

  BFText.body(this.text,
      {Color color = kcMediumGreyColor,
      FontWeight fontWeight = FontWeight.w500, double fontSize = 22})
      : style = bodyStyle.copyWith(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize); 

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      softWrap: true,
    );
  }
}
