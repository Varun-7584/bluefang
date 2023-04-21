
import 'package:flutter/material.dart';

class button extends StatelessWidget {
  const button(
      {required this.main_text,
        required this.any_color,
         this.onPressed,
        this.text_color
        // this.inputFormatters,
      });

  final String main_text;
  final Color any_color;
  final VoidCallback? onPressed;
  final Color? text_color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: any_color,
          ),
          child: Center(
            child: TextButton(
              onPressed: onPressed,
              child:  Text(main_text,
                style: TextStyle(
                  fontSize: 16,
                    color: text_color ?? Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


