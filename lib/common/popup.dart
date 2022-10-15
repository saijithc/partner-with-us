import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partnerwithus/google/google.dart';
import 'package:partnerwithus/helperfunction/helper_function.dart';
import 'package:partnerwithus/home/home_provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../login/view/login.dart';

options(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Text(
            "Do you want to logout your account ?",
            style: GoogleFonts.lobster(fontSize: 20, color: Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                context.read<HomeProvider>().next = false;
                context.read<HelperFuction>().saveUserLogged(false);
                context.read<HomeProvider>().clearTextfields();
                GoogleSignInApi.logout();
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (ctx) {
                  return const LoginScreen();
                }), (route) => false);
              },
              child: const Text(
                "Logout",
              ),
            )
          ],
        );
      });
}
