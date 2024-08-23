// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intelligent_customer_service/public_unit/bottom_tab.dart';
import 'package:intelligent_customer_service/store/index_provider.dart';
import 'package:intelligent_customer_service/store/public_provider.dart';
import './views/index/index.dart';
import './views/message/index.dart';
import '../../public_unit/drawer_menu.dart';
class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
   ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  
  final PageStorageBucket _bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    final List<Widget> indexRouterPages = <Widget>[
      Index(),
      Index(),
      Index(),
      const Message(),
      Index()
    ];
    
    int _BottomTabLevel = ref.watch(BottomTabLevel);
    
    bool _isEditChannel = ref.watch(IsEditChannal);
    print("$_isEditChannel");
    return Scaffold(
      resizeToAvoidBottomInset: true,
      onDrawerChanged:(isOpened) => {
        if(!isOpened){
          ref.read(DrawerMenuState.notifier).update((state)=>1)
        }
      },
      drawer: Drawer_menu(),
      body: Consumer(builder: (context, ref, _){
        // ignore: no_leading_underscores_for_local_identifiers
        
        int _DrawerMenuState = ref.watch(DrawerMenuState);
        if(_DrawerMenuState==0){
           Scaffold.of(context).openDrawer();
        }
        return PageStorage(
          bucket: _bucket, 
          child: SafeArea(
            top: true,
            bottom: true,
            child: indexRouterPages[_BottomTabLevel]
          ),
        );
      }),
      bottomNavigationBar: _isEditChannel ? null : const Bottom_tab()
    );
  }
}