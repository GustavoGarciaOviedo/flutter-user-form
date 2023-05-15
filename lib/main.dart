import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_user_form/providers/providers.dart';
import 'package:flutter_user_form/config/router/app_router.dart';
import 'config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> LoginFormProvider()),
        ChangeNotifierProvider(create: (_)=> UserFormProvider()),
      ],
      child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
      title: 'user form',
      theme: Apptheme().getTheme(),
      

      
    );
  }
  
}
