import 'package:flutter/material.dart';
// import '../../public_unit/bottom_tab.dart';

// 首页
class Message extends StatelessWidget{
  const Message({super.key});

  // Map router_data = ModalRoute.of(context).settings.arguments;

   @override
   Widget build(BuildContext context) {
    // return const Scaffold(
    //   body: SafeArea(
    //     top: true,
    //     child: Text("消息页"),
    //   ),
    //   bottomNavigationBar: SafeArea(
    //     bottom:  true,
    //     child:  Bottom_tab(newTabLevel: 3)
    //   ),
    // );
    return const Text("消息页");
   }
}