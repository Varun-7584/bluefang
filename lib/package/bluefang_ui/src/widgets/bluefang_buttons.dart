// ignore_for_file: prefer_const_constructors

import 'package:bluefang/package/bluefang_ui/src/shared/app_colors.dart';
import 'package:bluefang/package/bluefang_ui/src/shared/text_styles.dart';
import 'package:flutter/material.dart';

class BFButtons extends StatelessWidget {
  final String title;
  final bool disabled;
  final Color buttonColor;
  final bool busy;
  final double width;
  final double height;
  final Widget? leading;
  final bool outline;
  final VoidCallback onTap;
  const BFButtons(
      {Key? key,
      required this.title,
      this.disabled = false,
      this.busy = false,
      this.leading,
      required this.onTap,
      this.height = -1,
      this.width = double.infinity,
      this.outline = false,
      this.buttonColor = kcPrimaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: width,
        height: height == -1 ? 48 : height,
        alignment: Alignment.center,
        decoration: !outline
            ? BoxDecoration(
                color: !disabled ? buttonColor : kcMediumGreyColor,
                borderRadius: BorderRadius.circular(10),
              )
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: buttonColor, width: 2),
              ),
        child: !busy
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (leading != null) leading!,
                  if (leading != null) const SizedBox(width: 5),
                  SizedBox(
                    height: height == -1 ? null : height,
                    width: width == double.infinity ? null : width,
                    child: 
                      FittedBox(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(title,
                          style: captionStyle.copyWith(
                            fontWeight:
                                !outline ? FontWeight.bold : FontWeight.w600,
                            color: !outline ? Colors.white : buttonColor,
                          )),
                        ),
                      )
                  )
                ],
              )
            : const CircularProgressIndicator(
                strokeWidth: 3,
                color: Colors.white,
              ),
      ),
    );
  }
}
