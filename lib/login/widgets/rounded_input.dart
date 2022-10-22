import 'package:flutter/material.dart';
import 'package:gdm_bloc/login/widgets/input_container.dart';
import 'package:gdm_bloc/shared/constants.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    Key? key,
    required this.icon,
    required this.hint,
    this.label,
    this.error,
    required this.onChanged,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final String? label;
  final String? error;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        key: key,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(icon, color: kPrimaryColor),
          hintText: hint,
          labelText: label,
          errorText: error,
          filled: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
