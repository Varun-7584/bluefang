import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';

AppBar bFAppBar({
  required String title,
  Widget? trailingAction,
  VoidCallback? onTap,
  Widget? leading,
}) {
  return AppBar(
    title: FittedBox(
      fit: BoxFit.fitWidth,
      child: BFText.headingFour(
        title,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: kcWhite,
    elevation: 0,
    iconTheme: const IconThemeData(color: kcPrimaryColor),
    leading: leading,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: trailingAction != null
            ? InkWell(onTap: onTap ?? () {}, child: trailingAction)
            : const SizedBox(),
      )
    ],
  );
}
