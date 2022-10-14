import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partnerwithus/google/google.dart';
import 'package:provider/provider.dart';
import '../../common/textform.dart';
import '../../login/provider/loginprovider..dart';
import '../../login/view/login.dart';
import '../provider/sign_up_provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage(
        //           "assets/1.jpeg",
        //         ),
        //         fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Consumer<SignUPProvider>(
            builder: (context, value, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h * 0.1,
                  ),
                  Text(
                    'Sign Up',
                    style: GoogleFonts.lobster(
                        fontSize: 50,
                        color: const Color.fromARGB(255, 0, 76, 138)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Create your Account',
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.1,
                  ),
                  Form(
                      key: value.signUpFormKey,
                      child: Column(
                        children: [
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
                            decoration: textFieldInputDecoration('email',
                                radius: 10,
                                prefixicon: const Icon(Icons.email_outlined)),
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: value.nameController,
                            validator: (val) {
                              return val!.length >= 4
                                  ? null
                                  : "Username should contain atleast 4 characters";
                            },
                            decoration: textFieldInputDecoration('User Name',
                                radius: 10,
                                prefixicon:
                                    const Icon(Icons.person_outline_rounded)),
                          ),
                          const SizedBox(height: 15),
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
                                'Mobile Number',
                                radius: 10,
                                prefixicon:
                                    const Icon(Icons.phone_android_sharp)),
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: value.passwordController,
                            validator: (val) {
                              return val!.length == 6
                                  ? null
                                  : "Minimum 6 characters required";
                            },
                            obscureText:
                                context.watch<LoginProviver>().visibility,
                            decoration: textFieldInputDecoration('Password',
                                radius: 10,
                                prefixicon:
                                    const Icon(Icons.lock_outline_sharp),
                                icon: IconButton(
                                    onPressed: () {
                                      context
                                          .read<LoginProviver>()
                                          .checkVisibility();
                                    },
                                    icon: Icon(context
                                            .watch<LoginProviver>()
                                            .visibility
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined))),
                          ),
                        ],
                      )),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: w,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) =>
                                    const Color.fromARGB(255, 0, 76, 138))),
                        onPressed: () {
                          value.signUpValidation(context);
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(
                          //     builder: ((context) => const OtpScreen())));
                        },
                        child: const Text("Sign Up")),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: w,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.white)),
                        onPressed: () {
                          context.read<GoogleProvider>().signIn(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/google-icon.png",
                              width: 30,
                              height: 30,
                            ),
                            const Text(
                              "Sign Up with Google",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(height: 15),
                  RichText(
                      text: TextSpan(
                          text: "Already have an account? ",
                          style: GoogleFonts.rubik(
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (ctx) => const LoginScreen()));
                              },
                            text: "Login now",
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 0, 76, 138),
                                fontWeight: FontWeight.bold))
                      ]))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
