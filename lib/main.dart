import 'package:flutter/material.dart';
import 'package:target_challenge/project/home_page/home_page.dart';
import 'package:target_challenge/project/login_page/login_page.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Target Challenge',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(0, 65, 130, 1),
      ),
      initialRoute: '/login',
      routes: {
        // É aqui onde as rotas são definidas.
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
