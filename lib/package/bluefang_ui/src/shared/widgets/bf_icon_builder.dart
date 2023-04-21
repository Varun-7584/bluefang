import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';

class BFIconBuilder extends StatelessWidget {
  final IconData iconData;
  final double borderRadius;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color iconColor;
  final bool onlyIcon;
  final double iconSize;
  final String iconSemanticLabel;
  final TextDirection iconTextDirection;

  const BFIconBuilder({
    Key? key,
    required this.iconData,
    this.height = 40,
    this.borderRadius = 5.5,
    this.width = 40,
    this.backgroundColor = kcPrimaryColor,
    this.iconColor = kcWhite,
    this.onlyIcon = false,
    this.iconSize = 40,
    this.iconSemanticLabel = 'icon data not provided',
    this.iconTextDirection = TextDirection.ltr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !onlyIcon
        ? Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints(
                maxWidth: 50, maxHeight: 50, minHeight: 40, minWidth: 40,),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: backgroundColor),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                iconData,
                color: iconColor,
                size: iconSize,
                semanticLabel: iconSemanticLabel,
                textDirection: iconTextDirection,
              ),
            ),
          )
        : Icon(
            iconData,
            color: kcPrimaryColor,
            size: iconSize,
            semanticLabel: iconSemanticLabel,
            textDirection: iconTextDirection,
          );
  }
}
