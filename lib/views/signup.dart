import 'package:flutter/material.dart';
import 'package:fuba_app/controllers/login_controller.dart';
import 'package:fuba_app/widgets/emailfield.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/auth_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    // final AuthController actionControl = Get.put(AuthController());
    String selected = 'Albania';
    final GlobalKey<FormState> key = GlobalKey<FormState>();

    List<String> countries = controller.countries;
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
                children: [
                  Form(
                    key: key,
                    child: Column(
                      children: [
                        TextFormFieldEmail(
                            validate: controller.validateEmail,
                            emailController: controller.emailController),
                        const SizedBox(height: 10),
                        Obx(
                          () => TextFormField(
                            validator: controller.validatePassword,
                            controller: controller.passwordController,
                            obscureText: controller.isVisible.value,
                            decoration: InputDecoration(
                                label: Text('Password',
                                    style: GoogleFonts.poppins(fontSize: 14)),
                                hintStyle: const TextStyle(color: Colors.grey),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 0),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        Text(
                          'Password must be atleast 8 characters long and include 1 capital letter and 1 symbol',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.firstNameController,
                          decoration: InputDecoration(
                            label: Text('First Name',
                                style: GoogleFonts.poppins(fontSize: 14)),
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 0),
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.lastNameController,
                          decoration: InputDecoration(
                            label: Text('Last Name',
                                style: GoogleFonts.poppins(fontSize: 14)),
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 0),
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.dateController,
                          decoration: InputDecoration(
                            label: Text('Select Birth Date',
                                style: GoogleFonts.poppins(fontSize: 14)),
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 0),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          onTap: () => _selectDate(context, controller),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.none,
                          autocorrect: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        DropdownButtonFormField(
                          value: selected,
                          items: countries.map((country) {
                            return DropdownMenuItem(
                              value: country,
                              child: Text(country),
                            );
                          }).toList(),
                          onChanged: (selectedCountry) {
                            selected = selectedCountry.toString();
                          },
                          decoration: const InputDecoration(
                            labelText: 'Country',
                            hintText: 'Select your country',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                  fillColor:
                                      MaterialStateProperty.all(Colors.black),
                                  value: controller.isCheckedAgreement.value,
                                  onChanged: (value) =>
                                      controller.changeAgreement()),
                            ),
                            Text(
                              'I agree to the Terms and Privacy Policy',
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                  fillColor:
                                      MaterialStateProperty.all(Colors.black),
                                  value: controller.isCheckedPersonal.value,
                                  onChanged: (value) =>
                                      controller.changePersonal()),
                            ),
                            Text(
                              'Please use my personal information for the FUBA\nto send me messages and advertisements about\nproducts and initiatives of FUBA and its partners',
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (key.currentState!.validate()) {
                                Get.snackbar('Working', 'Thats good so far');
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black)),
                            child: Center(
                              child: Text(
                                'CREATE ACCOUNT',
                                style: GoogleFonts.nunito(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, controller) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (picked != null) {
      // print('Date selected: ${picked.toString()}');
      // birth_date = picked;
      // Do something with the selected date here
      controller.dateController.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }
}
