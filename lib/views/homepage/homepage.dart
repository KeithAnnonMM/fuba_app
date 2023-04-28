import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/submitbutton.dart';
import 'login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.jfif'),
                opacity: 0.03,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(35, 40, 35, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 370),
                  const SizedBox(
                    height: 50,
                    child: Image(image: AssetImage('assets/logo.jfif')),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: Text(
                      'WELCOME TO THE NEW FUBA APP',
                      style: GoogleFonts.nunito(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Personalize your FUBA experience and access top stories and highlights from your favorite players and teams ',
                    style: GoogleFonts.nunito(
                      fontSize: 19,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const SubmitButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
