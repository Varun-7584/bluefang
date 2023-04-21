// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';

class BFCardVehicleList extends StatelessWidget {
  final String? vehNumberText;
  final bool trailingIcon;
  final String vehModelText;
  final String? lifeDistText;
  final String vehYearText;
  final bool onlyIcon;
  final VoidCallback? onTap;
  final String trailingText;
  double fontSize;
  final Widget? image;
  final String? timeModified;
  final String? dateModified;
  double bxWidth = 15;

  BFCardVehicleList({
    Key? key,
    required this.vehNumberText,
    required this.vehModelText,
    required this.image,
    required this.vehYearText,
    this.lifeDistText,
    this.onTap,
    this.onlyIcon = false,
    this.trailingIcon = false,
    this.trailingText = "",
    this.fontSize = 22,
    this.timeModified,
    this.dateModified,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //If we just subtracted from the original vars, would get smaller every time build method is called
    double usedBoxWidth = bxWidth;
    double usedFontSize = fontSize;
    if (MediaQuery.of(context).size.width < 375){
      usedFontSize -= 8;
      usedBoxWidth -= 8;
    }
    else if (MediaQuery.of(context).size.width > 500){
      usedFontSize += 10;
      usedBoxWidth += 10;
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
                  flex: 3,
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
                SizedBox(
                  width: usedBoxWidth,
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
                    width: usedBoxWidth,
                  ),
                  Expanded(
                    flex: 3,
                  child: Column(
                    children: [
                      SizedBox(
                        child:FittedBox(
                          fit: BoxFit.fitWidth,
                          child: 
                          BFText.body((timeModified ?? "     ").padLeft(10), color: kcPrimaryColor, fontSize: usedFontSize),
                        ),
                      ), 
                      SizedBox(
                        //width: 50,
                        child:FittedBox(
                          fit: BoxFit.fitWidth,
                          child: 
                          BFText.body((dateModified ?? "      ").padLeft(14), color: kcPrimaryColor, fontSize: usedFontSize),
                        ),
                      ),  
                    ],
                  ),  
                  ),              
                  SizedBox(width: usedBoxWidth),
                  Expanded(
                    flex: 3,
                    child: 
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: BFText.body(vehYearText, color: kcPrimaryColor, fontSize: usedFontSize - 4)
                              ),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            image ??
                              SizedBox(width: bxWidth),
                          ],
                        ),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: BFText.subHeading(
                            vehModelText.padLeft(15),
                            color: kcPrimaryColor,
                            fontSize: usedFontSize
                          ),
                        ),
                      ],
                    ),
                  ),
            ],
          ),
        ),
      )
    );
  }
}
