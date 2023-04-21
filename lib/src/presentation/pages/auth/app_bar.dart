import 'package:flutter/material.dart';

import '../../../../package/bluefang_ui/src/shared/app_colors.dart';
import '../../../../package/bluefang_ui/src/widgets/bluefang_text.dart';


class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? leadingOnPressed;
  final IconData? leadingIcon;
  final VoidCallback? trailingOnPressed;
  final IconData? trailingIcon;

  const MyAppBar({
    Key? key,
    required this.title,
     this.leadingOnPressed,
     this.leadingIcon,
     this.trailingOnPressed,
     this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottomOpacity: 0.0,
        elevation: 0.0,
      backgroundColor: kcWhite,
        shadowColor: Colors.transparent,
      iconTheme: const IconThemeData(color: kcPrimaryColor),
      leading: IconButton(
        icon: Icon(leadingIcon),
        onPressed: () {
          leadingOnPressed!();
        },
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      title: Text(title),
      actions: [
        IconButton(
          icon: Icon(trailingIcon),
          onPressed: () {
            trailingOnPressed!();
          },
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
