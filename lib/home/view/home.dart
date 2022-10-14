import 'package:flutter/material.dart';
import 'package:partnerwithus/google/google.dart';
import 'package:partnerwithus/home/view/user_details.dart';
import 'package:provider/provider.dart';

import '../../login/view/login.dart';
import '../home_provider/home_provider.dart';
import 'description.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        height: h,
        width: w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgimage.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                  onPressed: () {
                    GoogleSignInApi.logout();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (ctx) => const LoginScreen()));
                  },
                  icon: const Icon(
                    Icons.power_settings_new_rounded,
                    size: 30,
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Consumer<HomeProvider>(
                    builder: (context, value, child) {
                      return value.next == false
                          ? const UserDetails()
                          : const Description();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
