import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../common/custom_text.dart';
import '../../common/textform.dart';
import '../home_provider/home_provider.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: h * 0.2,
              ),
              Text(
                'Partner with us',
                style: GoogleFonts.lobster(
                    fontSize: 30, color: const Color.fromARGB(255, 0, 76, 138)),
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: value.formKey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: value.nameController,
                      validator: (val) {
                        return val!.length >= 4
                            ? null
                            : "Username should contain atleast 4 characters";
                      },
                      decoration: textFieldInputDecoration(
                        'First Name',
                        radius: 5,
                        prefixicon: const Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      controller: value.numberController,
                      validator: (val) {
                        return val!.length == 10
                            ? null
                            : "Please provide a valid Phone number";
                      },
                      decoration: textFieldInputDecoration(
                        'Contact Number',
                        radius: 5,
                        prefixicon: const Icon(Icons.phone),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: value.emailConntroller,
                      validator: (val) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val!)
                            ? null
                            : "Please provide a valid email id";
                      },
                      decoration: textFieldInputDecoration(
                        'Email',
                        radius: 5,
                        prefixicon: const Icon(Icons.email_outlined),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: value.fssaiController,
                      validator: (val) {
                        return val!.length == 14
                            ? null
                            : "Add a valid FSSAI Code";
                      },
                      decoration: textFieldInputDecoration(
                        'FSSAI Code',
                        radius: 5,
                        prefixicon: const Icon(Icons.email_outlined),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 0, 76, 138)),
                        onPressed: () {
                          value.validation();
                        },
                        child: customText("Next"),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
