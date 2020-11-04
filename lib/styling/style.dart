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
  final String counterText;
  final TextEditingController controller;
  DefaultInput(
      {this.hintText,
      this.labelText,
      this.icon,
      this.autofocus = false,
      this.onChanged,
      this.counterText,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      autofocus: autofocus,
      controller: controller ?? null,
      maxLength: 30,
      cursorColor: Color(0xFFAD83FE),
      decoration: InputDecoration(
        counterText: counterText,
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

// Task Delete Background
class DismissableBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(right: 20),
            alignment: Alignment.centerRight,
            color: Colors.redAccent,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
