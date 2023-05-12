import 'package:flutter_user_form/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/user',
      name: UserScreen.name,
      builder: (context, state) => UserScreen(),
    ),

  ]
);