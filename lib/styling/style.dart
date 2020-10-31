import 'package:flutter/material.dart';

// Big Text Style <<<
const kBigText = TextStyle(
  fontSize: 30,
  color: Colors.white,
);

const kSubBigText = TextStyle(
  fontSize: 18,
  color: Colors.white,
);
// >>>

// Task List Style <<<

const kTaskTitle = TextStyle(
  fontWeight: FontWeight.bold,
);

const kTaskDescription = TextStyle(
  fontSize: 13,
);
// >>>

// Input for all over app
class DefaultInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Icon icon;
  final bool autofocus;
  final Function onChanged;
  DefaultInput(
      {this.hintText,
      this.labelText,
      this.icon,
      this.autofocus = false,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      autofocus: autofocus,
      maxLength: 30,
      cursorColor: Color(0xFFAD83FE),
      decoration: InputDecoration(
        counterText: '',
        prefixIcon: icon,
        labelText: labelText,
        alignLabelWithHint: true,
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
        hintMaxLines: 1,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.purple,
            width: 5,
          ),
        ),
      ),
    );
  }
}
