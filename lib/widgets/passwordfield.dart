import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

class TextFormFieldPassword extends StatelessWidget {
  const TextFormFieldPassword({
    super.key,
    required this.passwordController,
    required this.controller,
  });

  final TextEditingController passwordController;
  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: controller.isVisible.value,
      decoration: InputDecoration(
          label: Text('Password', style: GoogleFonts.poppins(fontSize: 14)),
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          suffixIcon: IconButton(
              onPressed: () => controller.changeOption(),
              icon: controller.isVisible.value == true
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off))),
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
