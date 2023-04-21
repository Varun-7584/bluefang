import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Text_Field extends StatefulWidget {
  const Text_Field({
     this.hint_text,
     this.validator,
    this.inputFormatters,
    this.textEditingController,
    this.textInputType,
  });

  final String? hint_text;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;

  @override
  _Text_FieldState createState() => _Text_FieldState();
}

class _Text_FieldState extends State<Text_Field> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      controller: widget.textEditingController,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          border: InputBorder.none,
          hintText: widget.hint_text,
          hintStyle: const TextStyle(color: Color(0xff375172)),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: ()=>widget.textEditingController?.clear(),
            splashRadius: 0.1, // removes the splash effect
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,

          )),
    );
  }
}
