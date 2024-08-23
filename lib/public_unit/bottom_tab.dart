import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intelligent_customer_service/store/public_provider.dart';
import '../static/style.dart';

// 底部导航栏
// ignore: camel_case_types
class Bottom_tab extends ConsumerStatefulWidget{

  // // 导航栏位置
  // final int newTabLevel;
  // // 页面内容位置
  // final Function(int) setCurrentIndex;
  const Bottom_tab({super.key});

  @override
  // ignore: library_private_types_in_public_api
  ConsumerState<ConsumerStatefulWidget> createState() => _bottom_tab_state();
}

// ignore: camel_case_types
class _bottom_tab_state extends ConsumerState<Bottom_tab> {
  @override
  Widget build(BuildContext context) {
    // 当前导航栏状态， 默认为首页
    late int tabLevel  = ref.watch(BottomTabLevel);
    TextStyle tabTextStyle(int thisTabLevel) {
      print("textstyle $thisTabLevel - $tabLevel");
      return TextStyle(
        color: tabLevel == thisTabLevel ? const Color(selected) : const Color(no_seleted),
        fontSize: primary_title_fontSize,
        fontWeight: FontWeight.w600,
        height: 1.5,
      );
    }

    ButtonStyle tabButtonStyle(){
      return const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(Color(primary_white)),
        padding: WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(vertical:0.0,horizontal: primary_padding)),
        alignment: Alignment.center,
        overlayColor: WidgetStatePropertyAll<Color>(Color(primary_white)),
        shadowColor: WidgetStatePropertyAll<Color>(Color(primary_white)),
        side: WidgetStatePropertyAll<BorderSide>(BorderSide(color: Color(primary_white), width: 0)),
        iconColor: WidgetStateColor.transparent
      );
    }
    return BottomAppBar(
      color: const Color(primary_white),
      height: primary_title_fontSize*4,
      padding: EdgeInsets.all(primary_title_fontSize/2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //均分底部导航栏横向空间
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 首页
          TextButton(style: tabButtonStyle(),
            onPressed: () {
              setState(() {tabLevel = 0;});
              print("bottom_tab index start $tabLevel");
              ref.read(BottomTabLevel.notifier).update((state)=> 0);
            },
            child: Text("首页", style: tabTextStyle(0)),
          ),

          // 购物
          TextButton(style: tabButtonStyle(),
              onPressed: () {
                setState(() {tabLevel = 1;});
                print("bottom_tab shopping start $tabLevel");
                ref.read(BottomTabLevel.notifier).update((state)=>1);
              },
              child: Text("购物", style: tabTextStyle(1))),

          // +
          IconButton(
            onPressed: () {
              setState(() {tabLevel = 2;});
              print("bottom_tab publish start $tabLevel");
              ref.read(BottomTabLevel.notifier).update((state)=>2);
            },
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(Colors.transparent),
              alignment: Alignment.center,
              overlayColor: WidgetStatePropertyAll<Color>(Colors.transparent),
              shadowColor: WidgetStatePropertyAll<Color>(Colors.transparent),
              side: WidgetStatePropertyAll<BorderSide>(BorderSide(color: Colors.transparent, width: 0)),
              padding: WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
              iconColor: WidgetStatePropertyAll<Color>(Colors.transparent),
              fixedSize: WidgetStatePropertyAll<Size>(Size(primary_title_fontSize*3, primary_title_fontSize*3))
              // iconSize: WidgetStatePropertyAll(icon_size)
            ),
            icon: Image.asset(
              "assets/image/icon/add.png",
              width: primary_title_fontSize*3,
              height: primary_title_fontSize*3,
            )
          ),
          // 消息
          TextButton(style: tabButtonStyle(),
              onPressed: () {
                setState(() {tabLevel = 3;});
                print("bottom_tab message start $tabLevel");
                ref.read(BottomTabLevel.notifier).update((state)=>3);
              },
              child: Text("消息", style: tabTextStyle(3))),

          // 我
          TextButton(style: tabButtonStyle(),
              onPressed: () {
                setState(() {tabLevel = 4;});
                print("bottom_tab mine start $tabLevel");
                ref.read(BottomTabLevel.notifier).update((state)=>4);
              },
              child: Text("我", style: tabTextStyle(4))),
        ],
      ),
    );
  }
}
