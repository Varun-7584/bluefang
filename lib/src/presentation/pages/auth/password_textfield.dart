import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    required this.hintText,
    required this.validator,
    this.textEditingController,
  });
  final String hintText;
  final FormFieldValidator<String> validator;
  final TextEditingController? textEditingController;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  final textEditingController = TextEditingController();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      obscureText: _obscureText,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        border: InputBorder.none,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Color(0xff375172)),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: _toggle,
          splashRadius: 0.1, // removes the splash effect
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,

        ),
      ),
      validator: widget.validator,
    );
  }
}
