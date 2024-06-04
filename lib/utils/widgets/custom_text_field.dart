import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController etText;
  final String label;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final Function(String)? onChanged;

  const CustomTextField(
      {super.key,
      required this.etText,
      required this.label,
      this.prefixIcon,
      this.textInputType,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: Colors.black45,
        keyboardType: textInputType ?? TextInputType.text,
        controller: etText,
        onChanged: onChanged,
        //
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            contentPadding:
                const EdgeInsets.only(left: 18, right: 12, top: 12, bottom: 12),

            //
            label: Text(label,
                style: const TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500))));
  }
}
