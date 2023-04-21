// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:developer';

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';

class BFCardVehicleExpandable extends StatelessWidget {
  final String? vehNumberText;
  final bool trailingIcon;
  final String? lifeDistText;
  final bool onlyIcon;
  final VoidCallback? onTap;
  final String trailingText;
  double fontSize;
  final String? timeModified;
  final String? dateModified;

  BFCardVehicleExpandable({
    Key? key,
    required this.vehNumberText,
    this.lifeDistText,
    this.onTap,
    this.onlyIcon = false,
    this.trailingIcon = false,
    this.trailingText = "",
    this.fontSize = 28,
    this.timeModified,
    this.dateModified,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double usedFontSize = fontSize;
    if (MediaQuery.of(context).size.width < 375){
      usedFontSize -= 8;
      log("Screen width: ${MediaQuery.of(context).size.width}");
    }
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Card(
        color: kcLightGreyColor,
        child: Padding(
          padding: EdgeInsets.all(2),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      vehNumberText!.padLeft(4).padLeft(5),
                      maxLines: 1,
                      style: TextStyle(
                        color: kcPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15
                ),
                Expanded(
                  flex: 3,
                  child: 
                    Row(
                      children: [
                        Expanded(
                            child: 
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: 
                              BFText.body(lifeDistText ?? " ", color: kcPrimaryColor, fontSize: usedFontSize),
                            ),
                          ),
                          const SizedBox(width: 5),
                          BFText.body(trailingText, color: kcPrimaryColor, fontSize: usedFontSize),
                        ]
                      ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 2,
                  child: Column(
                    children: [
                      SizedBox(
                        child:FittedBox(
                          fit: BoxFit.fitWidth,
                          child: BFText.body(timeModified ?? "     ", color: kcPrimaryColor, fontSize: usedFontSize),
                        ),
                      ), 
                      SizedBox(
                        child:FittedBox(
                          fit: BoxFit.fitWidth,
                          child: BFText.body((dateModified ?? "      ").padLeft(15), color: kcPrimaryColor, fontSize: usedFontSize),
                        ),
                      ),  
                    ],
                  ),  
                ),              
                if (MediaQuery.of(context).size.width < 375) const SizedBox(width: 60) else const SizedBox(width: 120),
                  
            ],
          ),
        ),
      )
    );
  }
}
