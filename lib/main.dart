import 'package:flutter/material.dart';
import 'package:partnerwithus/google/google.dart';
import 'package:partnerwithus/signup/provider/sign_up_provider.dart';
import 'package:provider/provider.dart';

import 'home/home_provider/home_provider.dart';
import 'login/provider/loginprovider..dart';
import 'login/view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => LoginProviver()),
        ChangeNotifierProvider(create: (_) => SignUPProvider()),
        ChangeNotifierProvider(create: (_) => GoogleProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
