import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';

/// Card to display information on the datatracs for the list of datatracs on [FleetManagerScreen]. 
class BFCardDatatracList extends StatelessWidget {
  final String text;
  final double imageHeight;
  final double imageWidth;
  final VoidCallback? onTap;
  final bool reprogrammable;
  // ignore: avoid_field_initializers_in_const_classes
  final double boxSize = 10;

  /// Card to display information on the datatracs for the list of datatracs on [FleetManagerScreen].
  /// 
  /// Displays the datatrac's number and an image showing whether or not it is reprogrammable. 
  const BFCardDatatracList({
    Key? key,
    required this.text,
    required this.reprogrammable,
    this.onTap,
    this.imageHeight = 50,
    this.imageWidth = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.0),
      child: Card(
        color: kcLightGreyColor,
        borderOnForeground: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
          child: Row (
            children: <Widget>[
              Expanded(
                child: BFText.body(text, color: kcBlack),
              ),
              SizedBox(
                width: imageWidth,
                height: imageHeight,
                child: Image.asset(reprogrammable
                    ? "assets/images/DataTracReprogrammable.png"
                    : "assets/images/DataTracTamperproof.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
