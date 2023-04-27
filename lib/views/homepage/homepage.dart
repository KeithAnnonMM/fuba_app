import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/op3.jpg'),
            fit: BoxFit.cover,
            opacity: 0.9,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 10, 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Container(width: 0)),
                  const SizedBox(
                      width: 70,
                      height: 70,
                      child: Image(image: AssetImage('assets/logo.jfif')))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 500),
                  Text(
                    'Welcome to the FUBA official App',
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Get ahead of the game with our app\'s comprehensive updates and analysis',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () => Get.to(() => const LoginPage()),
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
