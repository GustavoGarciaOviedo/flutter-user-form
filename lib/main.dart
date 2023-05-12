import 'package:flutter/material.dart';

import 'package:flutter_user_form/config/router/app_router.dart';
import 'config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'user form',
      theme: Apptheme().getTheme(),
      
    );
  }
}
