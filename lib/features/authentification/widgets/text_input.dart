import 'package:flutter/material.dart';

Widget textInputAuth(
    {controller, hint, icon, onChanged, obscureText, suffixIcon, keyboardType}) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.white,
    ),
    padding: const EdgeInsets.only(left: 1),
    child: TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType ??  TextInputType.multiline,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon,
      ),
    ),
  );
}
