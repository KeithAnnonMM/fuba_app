import 'package:flutter/material.dart';
import 'package:fuba_app/controllers/login_controller.dart';
import 'package:fuba_app/widgets/emailfield.dart';
import 'package:fuba_app/widgets/submitbutton.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    String selected = 'Albania';
    bool isChecked = false;

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
                    child: Column(
                      children: [
                        TextFormFieldEmail(emailController: emailController),
                        const SizedBox(height: 10),
                        Obx(
                          () => TextFormField(
                            controller: passwordController,
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
                          controller: firstNameController,
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
                          controller: lastNameController,
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
                          controller: dateController,
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
                          onTap: () => _selectDate(context),
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
                        CheckboxListTile(
                          title: Text('I agree to the Terms and Privacy Policy',
                              style: GoogleFonts.poppins(fontSize: 14)),
                          value: isChecked,
                          onChanged: (bool? value) {
                            isChecked = value!;
                          },
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
                            onPressed: () {},
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (picked != null) {
      // print('Date selected: ${picked.toString()}');
      // birth_date = picked;
      // Do something with the selected date here
      dateController.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }
}
