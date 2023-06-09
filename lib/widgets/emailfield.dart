import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldEmail extends StatelessWidget {
  const TextFormFieldEmail(
      {super.key, required this.emailController, required this.validate});

  final TextEditingController emailController;
  // ignore: prefer_typing_uninitialized_variables
  final validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      controller: emailController,
      decoration: InputDecoration(
        label: Text('Email', style: GoogleFonts.poppins(fontSize: 14)),
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.none,
      autocorrect: true,
    );
  }
}
