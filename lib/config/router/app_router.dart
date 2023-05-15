

import 'package:flutter/material.dart';

import '../../screens/screens.dart';

class AppRouter {
  static const initialRoute = LoginScreen.name;

  static Map<String, Widget Function(BuildContext)> routes ={
        LoginScreen.name     : (_) => const LoginScreen(),
        UserScreen.name      : (_) => const UserScreen(),
        UserDataScreen.name  : (_) => const UserDataScreen(),

  };

}