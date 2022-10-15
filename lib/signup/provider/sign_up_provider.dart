import 'package:flutter/material.dart';
import 'package:partnerwithus/helperfunction/helper_function.dart';
import 'package:provider/provider.dart';
import '../../home/view/home.dart';

class SignUPProvider with ChangeNotifier {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailConntroller = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  signUpValidation(BuildContext context) {
    if (signUpFormKey.currentState!.validate()) {
      context.read<HelperFuction>().saveUserLogged(true);
      numberController.clear();
      emailConntroller.clear();
      nameController.clear();
      passwordController.clear();
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) {
        return const HomeScreen();
      }), (route) => false);
    }
  }
}
