import 'package:flutter/material.dart';
import 'package:flutter_application_1/constance.dart';
import 'package:flutter_application_1/view/widget/customText.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final String hint;
  final VoidCallback onSave;
  final VoidCallback validator;

// Constructor
  CustomTextField({
    required this.text,
    required this.hint,
    required this.onSave,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          customText(
            text: text,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            // if there is an error here just replace the onSave() with     onSave: (value) {}
            onSaved: (newValue) {},
            validator: (newValue) {},
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.black),
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
