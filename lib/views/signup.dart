import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black)),
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/logo.jfif', height: 30),
            const SizedBox(width: 10),
            Text(
              'CREATE ACCOUNT',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logo.jfif'), opacity: 0.03)),
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                children: [],
              ),
            ),
          )
        ],
      ),
    );
  }
}
