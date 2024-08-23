import 'package:flutter/material.dart';
import 'package:intelligent_customer_service/home.dart';
// import 'home.dart';
// import 'home2.dart';
// import './views/index/index.dart';
// import './views/message/index.dart';


class Routers extends StatelessWidget {
  const Routers({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'PrimaryFonts', // 设置全局字体
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        // '/index': (context) => const Index(),
        // '/message': (context) => const Message(),
      },
    );
  }
}


