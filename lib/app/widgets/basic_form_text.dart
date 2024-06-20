import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BasicFormText extends StatelessWidget {
  const BasicFormText({
    required this.name,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.validator,
    this.keyboardType,
    this.obsecureText = false,
    super.key,
  });

  final String name;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      inputFormatters: inputFormatters,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obsecureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
