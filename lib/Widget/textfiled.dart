import 'package:flutter/material.dart';

class TextFiledWidget extends StatelessWidget {
  const TextFiledWidget(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.icon,
      this.obscureText = false,
      this.prificxText,
      this.onTap,
      this.colorHint,
      required this.errorText,
     this.sufixText,
      required this.keyboardType})
      : super(key: key);

  final TextEditingController controller;

  final String hintText;
  final IconButton icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? errorText;
  final String? prificxText;
  final Function()? onTap;
  final Color? colorHint;
  final String? sufixText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      controller: controller,
      obscuringCharacter: '*',
      onTap: onTap,
      decoration: InputDecoration(
          hintStyle: TextStyle(color: colorHint),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          hintText: hintText,
          errorText: errorText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black38, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black38, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          prefixText: prificxText,
          prefixStyle: const TextStyle(color: Colors.black26),
          prefixIcon: icon,
          suffixText: sufixText),
    );
  }
}
