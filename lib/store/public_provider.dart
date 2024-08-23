import 'package:hooks_riverpod/hooks_riverpod.dart';

// 底部导航栏-首页页面
final BottomTabLevel = StateProvider((ref)=> 0);

// 侧边栏-打开：0，关闭：1
final DrawerMenuState = StateProvider((ref)=>1);

// 定位
final NeighboringLocation = StateProvider((ref)=>"");
