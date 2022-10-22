import 'package:flutter/material.dart';
import 'package:gdm_bloc/login/widgets/input_container.dart';
import 'package:gdm_bloc/shared/constants.dart';

class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({
    Key? key,
    required this.hint,
    required this.onChanged,
    this.error,
  }) : super(key: key);

  final String hint;
  final String? error;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        key: key,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        obscureText: true,
        decoration: InputDecoration(
          icon: const Icon(Icons.lock, color: kPrimaryColor),
          hintText: hint,
          errorText: error,
          filled: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
