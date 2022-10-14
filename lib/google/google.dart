import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:partnerwithus/common/cutom_snackbar.dart';
import 'package:partnerwithus/home/view/home.dart';
import 'package:provider/provider.dart';

import '../home/home_provider/home_provider.dart';

class GoogleProvider with ChangeNotifier {
  signIn(BuildContext context) {
    try {
      GoogleSignInApi.login().then((value) {
        log(value.toString());
        if (value != null) {
          context.read<HomeProvider>().emailConntroller.text = value.email;
          context.read<HomeProvider>().nameController.text = value.displayName!;
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => const HomeScreen()));
          log(value.toString());
        }
      });
    } catch (e) {
      customSnackBar(context, e.toString());
      log(e.toString());
    }
  }
}

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn(
    scopes: <String>['email'],
  );
  static Future<GoogleSignInAccount?> login() async {
    try {
      log('hei sai');
      final credential = await _googleSignIn.signIn();
      log(credential!.email.toString());
      log(credential.displayName!);
      return credential;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static logout() {
    _googleSignIn.signOut();
  }
}
