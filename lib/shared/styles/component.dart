import 'package:flutter/material.dart';

Widget customTextFormField({
  required TextEditingController? controller,
  required TextInputType? keyboardType,
  FormFieldValidator<String>? validator,
  ValueChanged<String>? sumbit,
  required String label,
  required IconData prefixicon,
  required String hintText,
  GestureTapCallback? onTap,
  int? lines,
}) =>
    TextFormField(
      maxLines: lines,
      onTap: onTap,
      controller: controller,
      keyboardType: keyboardType,
      onFieldSubmitted: sumbit,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixicon),
        hintText: hintText,
        isDense: true,
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        disabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
