import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intelligent_customer_service/store/index_provider.dart';
import 'package:intelligent_customer_service/store/public_provider.dart';
import 'package:intelligent_customer_service/views/index/concerns.dart';
import 'package:intelligent_customer_service/views/index/discoveries.dart';
import 'package:intelligent_customer_service/views/index/neighboring.dart';
import '../../static/style.dart';


class Index extends ConsumerStatefulWidget {
  const Index({super.key});

  @override
  // ignore: library_private_types_in_public_api
   ConsumerState<ConsumerStatefulWidget> createState() => _IndexState();
}

// 首页
class _IndexState extends ConsumerState<Index> with TickerProviderStateMixin {
   @override
   Widget build(BuildContext context) {

     // tab bar 控制器自定义
     late TabController _tabController = TabController(vsync: this, length: 3, initialIndex: ref.watch(IndexTabLevel));
     // 启动声明周期
     void initState() {
       super.initState();

       // 控制器监听tabbar
       _tabController.addListener((){
         ref.read(IndexTabLevel.notifier).update((state)=>_tabController.index);
       });
     }
     // 销毁生命周期
     void dispose() {
       _tabController.dispose();
       super.dispose();
     }

    int _IndexTabLevel = ref.watch(IndexTabLevel);
    String _NeighboringLocation = ref.watch(NeighboringLocation);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(primary_white),
          leadingWidth: primary_title_fontSize_selected*2,
          leading: Consumer(
            builder: (context, ref, _)=> IconButton(
              // icon: const Icon(
              //   Icons.dehaze_rounded, 
              //   color: Color(selected),
              //   size: primary_title_fontSize,
              //   weight: 20.0,
              // ),
              icon: ImageIcon(
                AssetImage("assets/image/icon/menu.png"),
                color: Color(selected),
                size:  primary_title_fontSize_selected*2
              ),
              onPressed: (){
                ref.read(DrawerMenuState.notifier).update((state)=>0);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
          title:  TabBar(
            controller: _tabController,
            dividerColor: Colors.transparent,
            indicatorColor: Color(primary_color),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(primary_padding),
            overlayColor: WidgetStatePropertyAll<Color>(Color(primary_white)),
            labelStyle: const TextStyle(
              color: Color(selected),
              fontSize:primary_title_fontSize, 
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
              height: 1.5
            ),
            unselectedLabelStyle: const TextStyle(
              color: Color(no_seleted),
              fontSize: primary_title_fontSize, 
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
              height: 1.5
            ),
            tabs: <Widget>[
              Tab(text: '关注'),
              Tab(text: '发现'),
              // ignore: unnecessary_string_interpolations
              Tab(text: '${_NeighboringLocation=="" ? "附近" : _NeighboringLocation}')
            ],
            onTap: (int index){
              ref.read(IndexTabLevel.notifier).update((state)=>index);
            },
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {}, 
              // icon: const Icon(Icons.search_outlined)
              icon: ImageIcon(
                AssetImage("assets/image/icon/search.png"),
                color: Color(selected),
                size:  primary_title_fontSize_selected*1.2
              ),
            )
          ],
        ),
        // drawer: Drawer_menu(),
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            // TabPage(),
            // PageStorage(bucket: _bucket, child: Text("发现页面")),
            // PageStorage(bucket: _bucket, child: Text("附近页面")),
            TabPage(key: PageStorageKey("0")),
            TabPage(key: PageStorageKey("1")),
            TabPage(key: PageStorageKey("2")),
            
            
            // Text("发现页面"),
            // Text("附近页面")
          ]
        
        ),
        // body: PageStorage(
        //   bucket: _bucket,
        //   child: TabBarView(children: indexPages),
        // ),
      );

   }
}

final List<Widget> indexPages = <Widget>[
      Concerns(),
      Discoveries(),
      Neighboring()
];

class TabPage extends ConsumerWidget {
  const TabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int _IndexTabLevel = ref.watch(IndexTabLevel);
    // PageStorageBucket _bucket = ref.read(Bucket);
    
    return Container(
        key: PageStorageKey("$_IndexTabLevel"),
        child: indexPages[_IndexTabLevel],
      );
  }
}