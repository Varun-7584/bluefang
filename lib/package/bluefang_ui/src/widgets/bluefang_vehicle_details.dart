// ignore_for_file: must_be_immutable

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';

class BFCardVehicleDetail extends StatelessWidget {
  final IconData? leadingIcon;
  final String? imagePath;
  final bool trailingIcon;
  final String text;
  final String? subtext;
  final bool onlyIcon;
  final VoidCallback? onTap;
  final String trailingText;
  double fontSize;

  BFCardVehicleDetail({
    Key? key,
    this.leadingIcon,
    this.imagePath,
    required this.text,
    this.subtext,
    this.onTap,
    this.onlyIcon = false,
    this.trailingIcon = false,
    this.trailingText = "",
    this.fontSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double usedFontSize = fontSize;
    if (MediaQuery.of(context).size.width < 375){
      usedFontSize -= 6;
    }
    else if (MediaQuery.of(context).size.width > 500){
      usedFontSize += 8;
    }
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Row(
        children: <Widget>[
          if (leadingIcon != null)
            BFIconBuilder(
                iconData: leadingIcon!,
                onlyIcon: onlyIcon,
                height: 50,
                width: 50)
          else if (imagePath != null)
            Image.asset(
              imagePath!,
              height: 50,
              width: 50,
              fit: BoxFit.fill
            )
          else
            const SizedBox(),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BFText.subHeading(
                      text,
                      color: kcPrimaryColor,
                      fontSize: usedFontSize
                    ),
                    if (subtext != null)
                      BFText.body(subtext!, fontSize: usedFontSize)
                    else
                      const SizedBox()
                  ],
                ),
                if (MediaQuery.of(context).size.width < 375) const SizedBox(width: 10) else const SizedBox(width: 25),
                BFText.caption(trailingText),
              ]),
              tileColor: kcLightGreyColor,
              trailing: trailingIcon
                  ? const Icon(Icons.navigate_next, color: kcPrimaryColor)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
