import 'package:bluefang/package/bluefang_ui/src/shared/app_colors.dart';
import 'package:bluefang/package/bluefang_ui/src/widgets/bluefang_text.dart';
import 'package:flutter/material.dart';

SnackBar bFSnackBar({
  required String content,
  required String type,
  required VoidCallback onActionClick,
  bool showAction = false,
}) {
  Icon icon;
  Color color;

  switch (type.toLowerCase()) {
    case 'success':
      {
        icon = const Icon(
          Icons.check_circle,
          color: kcWhite,
        );
        color = kcSucessColor;
      }
      break;

    case 'error':
      {
        icon = const Icon(
          Icons.error,
          color: kcWhite,
        );
        color = kcErrorColor;
      }
      break;
    case 'info':
      {
        icon = const Icon(
          Icons.info,
          color: kcWhite,
        );
        color = kcInfoColor;
      }
      break;
    case 'warning':
      {
        icon = const Icon(
          Icons.warning,
          color: kcWhite,
        );
        color = kcWarningColor;
      }
      break;
    default:
      {
        icon = const Icon(
          Icons.check,
          color: kcWhite,
        );
        color = kcSucessColor;
      }
  }
  return SnackBar(
    content: Row(
      children: [
        icon,
        const SizedBox(
          width: 5,
        ),
        BFText.caption(content, color: kcWhite, fontWeight: FontWeight.w600)
      ],
    ),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
    action: showAction
        ? SnackBarAction(
            label: 'Retry?',
            textColor: kcWhite,
            disabledTextColor: kcMediumGreyColor,
            onPressed: onActionClick,
          )
        : null,
  );
}
