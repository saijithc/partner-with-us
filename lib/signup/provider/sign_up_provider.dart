import 'package:flutter/material.dart';

import '../../home/view/home.dart';

class SignUPProvider with ChangeNotifier {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailConntroller = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  signUpValidation(BuildContext context) {
    if (signUpFormKey.currentState!.validate()) {
      numberController.clear();
      emailConntroller.clear();
      nameController.clear();
      passwordController.clear();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => const HomeScreen())));
    }
  }
}
