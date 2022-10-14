import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../home/view/home.dart';

class LoginProviver with ChangeNotifier {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailConntroller = TextEditingController();
  bool visibility = false;
  checkVisibility() {
    visibility = !visibility;
    notifyListeners();
  }

  final loginFormKey = GlobalKey<FormState>();
  loginValidation(BuildContext context) {
    if (loginFormKey.currentState!.validate()) {
      emailConntroller.clear();
      passwordController.clear();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => const HomeScreen())));
    }
  }
}
