import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';

class BFExpandableVehicleList extends StatelessWidget {
  final Widget leading;
  final IconData trailingIcon;
  final String text;
  final String? subtext;
  final bool onlyIcon;
  final VoidCallback? onTap;
  const BFExpandableVehicleList({
    Key? key,
    required this.leading,
    required this.text,
    this.subtext,
    this.onTap,
    this.onlyIcon = false,
    required this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: buildTile());
  }

  Widget buildTile() {
    return Container(
      color: kcLightGreyColor,
      padding: const EdgeInsets.all(10),
      child: ListTile(
          tileColor: kcLightGreyColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Row(children: [
            Container(
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: kcPrimaryColor),
              child: FittedBox(
                  fit: BoxFit.fill,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: leading)),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BFText.body(
                  text,
                  color: kcBlack,
                ),
                if (subtext != null)
                  BFText.caption(subtext!)
                else
                  const SizedBox()
              ],
            )
          ]),
          trailing: BFIconBuilder(
            iconData: trailingIcon,
            borderRadius: 99.0,
          )),
    );
  }
}
