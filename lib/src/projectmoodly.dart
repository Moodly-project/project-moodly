import 'package:appfluxolivre/src/pages/create_user_page.dart';
import 'package:appfluxolivre/src/pages/home_page.dart';
import 'package:appfluxolivre/src/pages/login_page.dart';
import 'package:appfluxolivre/src/pages/splash_page.dart';
import 'package:flutter/material.dart';

class ProjectMoodly extends StatelessWidget {
  const ProjectMoodly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ProjectMoodly",
      initialRoute: '/Splash',
      routes: {
        '/Splash': (_) => SplashPage(),
        '/': (_) => LoginPage(),
        '/home': (_) => HomePage(),
        '/createuser': (_) => CreateUserPage(),
      },
    );
  }
}
