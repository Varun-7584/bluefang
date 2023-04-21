import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';

class BFCardVehicleList2 extends StatelessWidget {
  final String leadingText;
  final String text;
  final String subtext;
  final Widget image;
  final double iconHeight;
  final double iconWidth;
  final double iconSize;
  final double imageHeight;
  final double imageWidth;
  final VoidCallback? onTap;
  final bool onlyIcon;
  // ignore: avoid_field_initializers_in_const_classes
  final double boxSize = 10;
  const BFCardVehicleList2({
    Key? key,
    required this.leadingText,
    required this.text,
    required this.subtext,
    this.onTap,
    this.onlyIcon = true,
    this.iconHeight = 25,
    this.iconWidth = 25,
    this.iconSize = 20,
    this.imageHeight = 20,
    this.imageWidth = 50,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.0),
      child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          tileColor: kcLightGreyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Row(
            children: <Widget>[
              SizedBox(
                width: 60,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  clipBehavior: Clip.hardEdge,
                  child: BFText.body(
                    leadingText,
                    color: kcPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: boxSize),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BFText.body(
                    text,
                    color: kcBlack,
                  ),
                  Row(
                    children: <Widget>[
                      Row(
                        children: [
                          image,
                          SizedBox(
                            width: boxSize,
                          ),
                          Image.asset("assets/images/DistanceIcon.png",
                              height: iconHeight, width: iconWidth),
                          SizedBox(width: boxSize),
                          BFText.caption(subtext),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ),
    );
  }
}
