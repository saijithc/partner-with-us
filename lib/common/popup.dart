import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partnerwithus/google/google.dart';
import 'package:partnerwithus/helperfunction/helper_function.dart';
import 'package:partnerwithus/home/home_provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../login/view/login.dart';

options(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.only(
              top: height * 0.3, bottom: height * 0.32, left: 30, right: 30),
          backgroundColor: Colors.white.withOpacity(0.8),
          content: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Do you want to logout your account ?",
                    style:
                        GoogleFonts.lobster(fontSize: 20, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () {
                            context.read<HelperFuction>().saveUserLogged(false);
                            context.read<HomeProvider>().clearTextfields();
                            GoogleSignInApi.logout();
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (ctx) {
                              return const LoginScreen();
                            }), (route) => false);
                          },
                          child: const Text("Logout")),
                    ),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel")),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
