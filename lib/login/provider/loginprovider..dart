import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:partnerwithus/helperfunction/helper_function.dart';
import 'package:provider/provider.dart';

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
      context.read<HelperFuction>().saveUserLogged(true);
      emailConntroller.clear();
      passwordController.clear();
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) {
        return const HomeScreen();
      }), (route) => false);
    }
  }
}
