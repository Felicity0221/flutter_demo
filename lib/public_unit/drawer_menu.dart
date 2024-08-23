// ignore_for_file: prefer_initializing_formals, camel_case_types, unnecessary_string_interpolations

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../static/style.dart';

  class Menu{
    late String icon;
    late String name;
    Menu({required String icon, required String name}){
      this.icon = icon;
      this.name = name;
    }
  }

  _iconButton(String icon, String name) => 
  OutlinedButton(
    style: const ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(Colors.transparent),
      side: WidgetStatePropertyAll<BorderSide>(
        BorderSide(color: Colors.transparent)),
      foregroundColor: WidgetStatePropertyAll<Color>(Colors.transparent),
      overlayColor: WidgetStatePropertyAll<Color>(Colors.transparent),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(primary_padding*1.7),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(primary_img_bgcolor),
          ),
          child:  Image.asset(
            "$icon",
            width: primary_text_fontSize*1.3,
            height: primary_text_fontSize*1.3,
          ),
        ),
        
        Text(
          "$name", 
          style: const TextStyle(
            color: Color(no_seleted),
            fontSize: primary_text_fontSize/1.3,
            fontWeight: FontWeight.w400
          ),
        )
      ],
    ),
    onPressed: (){},
  );

// ignore: must_be_immutable
class Drawer_menu extends StatelessWidget{
  List<List<Menu>> menus = [
    [
      Menu(icon:"assets/image/icon/friends.png",name:"发现好友")
    ],
    [
      Menu(icon: "assets/image/icon/creative.png", name: "创作中心"),
      Menu(icon: "assets/image/icon/draft.png", name: "我的草稿"),
      Menu(icon: "assets/image/icon/reviews.png", name: "我的评论"),
      Menu(icon: "assets/image/icon/history.png", name: "浏览记录")
    ],
    [
      Menu(icon: "assets/image/icon/order.png", name: "订单"),
      Menu(icon: "assets/image/icon/cart.png", name: "购物车"),
      Menu(icon: "assets/image/icon/purses.png", name: "钱包")
    ],
    [
      Menu(icon: "assets/image/icon/communal.png", name: "社区公约")
    ]
  ];

  Drawer_menu({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        top:true, 
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(primary_padding*2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded( 
                child: ListView(
                  children: [
                    for (int i = 0; i < menus.length; i++)
                      ListBody(
                        children: [
                          Column(
                            children: [
                              for(int j=0; j<menus[i].length; j++)
                                ListTile(
                                  titleAlignment: ListTileTitleAlignment.center,
                                  leading: Image.asset(
                                    '${menus[i][j].icon}',
                                    width: primary_text_fontSize,
                                    height: primary_text_fontSize,
                                  ),
                                  titleTextStyle: const TextStyle(
                                    color: Color(selected),
                                    fontSize: primary_text_fontSize,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.0,
                                    height: 1.5,
                                  ),
                                  title: Text('${menus[i][j].name}'),
                                )
                            ],
                          ),
                          i<(menus.length-1) ? const Divider() : const SizedBox(width: 0, height: 0), 
                        ],
                      )
                  ],
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _iconButton("assets/image/icon/setting.png","设置"),
                  _iconButton("assets/image/icon/service.png", "帮助与客服"),
                  _iconButton("assets/image/icon/scan.png", "扫一扫")
                ],
              )
            
            ],
          ),
        ),
      )
      
    );
  }
}