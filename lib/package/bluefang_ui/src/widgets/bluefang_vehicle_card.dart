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
  final double? fontSize;

  const BFCardVehicleDetail({
    Key? key,
    this.leadingIcon,
    this.imagePath,
    required this.text,
    this.subtext,
    this.onTap,
    this.onlyIcon = false,
    this.trailingIcon = false,
    this.trailingText = "",
    this.fontSize = 28,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    ),
                    if (subtext != null)
                      BFText.body(subtext!)
                    else
                      const SizedBox()
                  ],
                ),
                const SizedBox(width: 25),
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
