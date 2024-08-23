// 发现
// ignore_for_file: unused_element, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intelligent_customer_service/public_unit/waterfalls.dart';
import 'package:intelligent_customer_service/static/style.dart';
import 'package:intelligent_customer_service/store/index_provider.dart';


// 频道位置样式
const ChannelTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: Color(selected),
  fontSize: primary_text_fontSize/1.5,
  decoration: TextDecoration.none,
);

// 频道位置编辑样式
class ChannelEditLocation extends StatelessWidget{
  String info;
  Function(String info) onAccept;
  Function(String info) onClose;
  ChannelEditLocation({
    super.key, 
    required this.info, 
    required this.onAccept,
    required this.onClose
  });

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      // 当前数据
      data: info,
      // 拖动时在指针下显示的小部件
      feedback: Badge(
        label: const Icon(
          Icons.close,
          size: primary_text_fontSize/2,
        ),
        backgroundColor: Color(primary_img_bgcolor),
        child: ChannelSelect(info: Text(info, style: ChannelTextStyle), bgColor: Color(primary_white)),
      ),
      // 在一个或多个拖动过程中显示的部件，而不是子部件。
      childWhenDragging: SizedBox(
        width: (MediaQuery.of(context).size.width / 4) - primary_padding * 2,
        height: primary_text_fontSize * 3,
        // padding: EdgeInsets.all(primary_padding),
      ),
      // 树中这个小部件下面的小部件。
      child: DragTarget<String>(

        onAcceptWithDetails: (data)=> onAccept(data.data),

        builder: (context, candidateData, rejectedData) {
          return TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(Color(primary_white)),
              overlayColor: WidgetStatePropertyAll<Color>(Color(primary_white)),
              iconColor: WidgetStatePropertyAll<Color>(Color(selected)),
              fixedSize: WidgetStatePropertyAll<Size>(
                Size(
                  (MediaQuery.of(context).size.width / 4) - primary_padding*2, 
                  primary_text_fontSize * 3
                )
              ),
              padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
            ),
            onPressed: ()=>onClose(info), 
            child:  Badge(
              // label: const Icon(
              //   ,
              //   size: primary_text_fontSize/2,
              // ),
              label: ImageIcon(
                AssetImage("assets/image/icon/close.png"),
                size: primary_text_fontSize
              ),
              // backgroundColor: Color(primary_img_bgcolor),
              child: ChannelSelect(info: Text(info, style: ChannelTextStyle), bgColor: Color(primary_white)),
            )
          );
        },
      ),
    );
  }
}

// 选择频道样式
class ChannelSelect extends StatelessWidget{
  Widget info;
  Color bgColor;
  ChannelSelect({super.key, required this.info, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 4) - primary_padding * 2,
      height: primary_text_fontSize * 3,
      padding: EdgeInsets.all(primary_padding),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(
          color: Color(primary_img_bgcolor), // 边框颜色
          width: 1, // 边框宽度
        ),
        borderRadius: BorderRadius.circular(5.0), // 圆角
      ),
      child: info,
    );
  }
}

// 频道编辑导航栏
class EditChannel extends ConsumerStatefulWidget {
  // final Function setChannel;
  // const EditChannel({super.key, required this.setChannel});
  EditChannel({super.key});

  ConsumerState<ConsumerStatefulWidget> createState() => _EditChannelState();
}

class _EditChannelState extends ConsumerState<EditChannel> {
  // 频道列表
  late List<String> _items = ref.watch(ChannelList);

  // 已选的频道列表
  late List<int> _SelectedChannel = ref.watch(SelectedChannel);
  // 未选的频道列表
  late List<int> _NoSelectChannel = ref.watch(NoSelectChannel);

  // 是否进入频道编辑
  bool _isChannelEditLocation = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(primary_padding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // 我的频道
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "我的频道",
                      style: TextStyle(
                        color: Color(selected),
                        fontSize: primary_title_fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: primary_padding),
                    Text(
                      "点击进入频道",
                      style: TextStyle(
                          color: Color(no_seleted),
                          fontSize: primary_text_fontSize,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isChannelEditLocation = !_isChannelEditLocation;
                        });
                      },
                      // ignore: sort_child_properties_last
                      child: Text(
                        "${_isChannelEditLocation ? '完成编辑' : '进入编辑'}",
                        style: const TextStyle(
                          color: Color(selected),
                          fontWeight: FontWeight.w600,
                          fontSize: primary_text_fontSize
                        ),
                      ),
                      style: const ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor: WidgetStatePropertyAll<Color>(
                            Color(primary_img_bgcolor)),
                        padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(horizontal: primary_padding/4, vertical: primary_padding)
                        )
                      ),
                    ),
                    const SizedBox(width: primary_padding),
                    IconButton(
                        onPressed: () {
                          ref
                              .read(IsEditChannal.notifier)
                              .update((state) => false);
                        },
                        icon: const ImageIcon(
                          AssetImage("assets/image/icon/top.png"),
                          size: primary_text_fontSize * 1.3,
                        ))
                  ],
                ),
              ],
            ),
            // 频道列表
            Wrap(
              spacing: primary_padding, // 水平方向间距
              runSpacing: primary_padding, // 垂直方向间距
              crossAxisAlignment: WrapCrossAlignment.center,
              children: _isChannelEditLocation ?
              [
                ChannelSelect(info: Text("推荐", style: ChannelTextStyle), bgColor: Color(primary_img_bgcolor)),
                ChannelSelect(info: Text("视频", style: ChannelTextStyle), bgColor: Color(primary_img_bgcolor)),
                ChannelSelect(info: Text("直播", style: ChannelTextStyle), bgColor: Color(primary_img_bgcolor)),
                for(int i=0; i<_SelectedChannel.length; i++)
                  ChannelEditLocation(
                    info: _items[_SelectedChannel[i]],
                    onAccept: (String info){
                      List<int> newSelected = _SelectedChannel;
                      int fromIndex = newSelected.indexOf(_items.indexOf(info));
                      print("formIndex-i1: $fromIndex - $i");
                      if(fromIndex != i){
                        print("formIndex-i2: $fromIndex - $i");
                         // 移除原位置的项并插入到目标位置
                         int selectedToMove = newSelected.removeAt(fromIndex);
                         newSelected.insert(i, selectedToMove);
                      }
                      setState(() {
                        _SelectedChannel = newSelected;
                      });
                      ref.read(SelectedChannel.notifier).update((state)=>newSelected);
                    },
                    onClose: (String info){
                      print("_SelectedChannel: ${_SelectedChannel}");
                      List<int> newSelected = _SelectedChannel;
                      List<int> newNoSelect = _NoSelectChannel;
                      print("newSelected1: ${newSelected}");
                      newSelected.remove(_items.indexOf(info));
                      newNoSelect.add(_items.indexOf(info));
                      print("newSelected2: ${newSelected}");
                      setState(() {
                        _SelectedChannel = newSelected;
                        _NoSelectChannel = newNoSelect;
                      });
                      ref.read(SelectedChannel.notifier).update((state)=>newSelected);
                      ref.read(NoSelectChannel.notifier).update((state)=>newNoSelect);
                    },
                  )
              ] :
              [
                ChannelSelect(info: Text("推荐", style: ChannelTextStyle), bgColor: Color(primary_img_bgcolor)),
                ChannelSelect(info: Text("视频", style: ChannelTextStyle), bgColor: Color(primary_img_bgcolor)),
                ChannelSelect(info: Text("直播", style: ChannelTextStyle), bgColor: Color(primary_img_bgcolor)),
                for(int i=0; i<_SelectedChannel.length; i++)
                  ChannelSelect(info: Text(_items[_SelectedChannel[i]], style: ChannelTextStyle), bgColor: Color(primary_white))
              ]
            ),
            // 推荐频道
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "推荐频道",
                  style: TextStyle(
                    color: Color(selected),
                    fontSize: primary_title_fontSize_selected,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: primary_padding),
                Text(
                  "点击添加频道",
                  style: TextStyle(
                      color: Color(no_seleted),
                      fontSize: primary_title_fontSize,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            // 添加频道
            Wrap(
              spacing: primary_padding, // 水平方向间距
              runSpacing: primary_padding, // 垂直方向间距
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                for(int i=0; i<_NoSelectChannel.length; i++)
                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(Color(primary_white)),
                      overlayColor: WidgetStatePropertyAll<Color>(Color(primary_white)),
                      iconColor: WidgetStatePropertyAll<Color>(Color(selected)),
                      side: WidgetStatePropertyAll<BorderSide>(BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      )),
                      shadowColor: WidgetStatePropertyAll<Color>(Color(primary_white)),
                      fixedSize: WidgetStatePropertyAll<Size>(
                        Size(
                          (MediaQuery.of(context).size.width / 4) - primary_padding*2, 
                          primary_text_fontSize
                        )
                      ),
                      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
                    ),
                    onPressed: (){
                      print("add");
                      List<int> newSelected = _SelectedChannel;
                      List<int> newNoSelect = _NoSelectChannel;
                      newSelected.add(_NoSelectChannel[i]);
                      newNoSelect.removeAt(i);
                      setState((){
                        _SelectedChannel = newSelected;
                        _NoSelectChannel = newNoSelect;
                      });
                      ref.read(SelectedChannel.notifier).update((state)=>newSelected);
                      ref.read(NoSelectChannel.notifier).update((state)=>newNoSelect);
                    },
                    child: ChannelSelect(
                      info: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add),
                            Text(_items[_NoSelectChannel[i]],style: ChannelTextStyle)
                          ]
                        ),
                      bgColor: Color(primary_white)
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}


// 导航栏切换
class TabPageWidget extends ConsumerWidget {
  TabPageWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // PageStorageBucket _bucket = ref.read(Bucket);

    return SingleChildScrollView(
      key: PageStorageKey("${ref.watch(ChannelTabLevel)}"),
      child: WaterFalls(),
    );
  }
}

// 导航栏
class Channel extends ConsumerStatefulWidget {
  const Channel({super.key});
  @override
  // ignore: library_private_types_in_public_api
  ConsumerState<ConsumerStatefulWidget> createState() => _ChannelState();
}

class _ChannelState extends ConsumerState<Channel> with SingleTickerProviderStateMixin {
  late List<String> _ChannelList = ref.watch(ChannelList);
  late List<int> _SelectedChannel = ref.watch(SelectedChannel);

  List<String> myChannel = [];
  // List<String> myChannel = [];

  late int _channelTabLevel = ref.watch(ChannelTabLevel);

  // tab bar 控制器自定义
  late TabController _channelController;

  // 启动声明周期
  @override
  void initState() {
    super.initState();
    myChannel.addAll(["推荐","视频","直播"]);
    myChannel.addAll(
      List.generate(_SelectedChannel.length, (index)=>_ChannelList[_SelectedChannel[index]])
    );
    _channelController = TabController(
        vsync: this, length: myChannel.length, initialIndex: _channelTabLevel);
    // 控制器监听tabbar
    _channelController.addListener(() {
      ref
          .read(ChannelTabLevel.notifier)
          .update((state) => _channelController.index);
    });
  }

  // 销毁生命周期
  @override
  void dispose() {
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
              flex: 9,
              child: TabBar(
                controller: _channelController,
                dividerColor: Colors.transparent,
                isScrollable: true,
                padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero, 
                tabAlignment: TabAlignment.center,
                labelColor: const Color(selected),
                labelPadding: const EdgeInsets.all(primary_padding),
                labelStyle:
                    const TextStyle(fontSize: primary_text_fontSize,fontWeight: FontWeight.w600),
                indicatorColor: Colors.transparent,
                unselectedLabelColor: const Color(no_seleted),
                unselectedLabelStyle:
                    const TextStyle(fontSize: primary_text_fontSize,fontWeight: FontWeight.w400),
                tabs: [
                  for (int i = 0; i < myChannel.length; i++)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: primary_padding / 2),
                      child: Tab(
                        text: "${myChannel[i]}",
                      ),
                    )
                ],
              )
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                ref.read(IsEditChannal.notifier).update((state) => true);
              },
              icon: const ImageIcon(
                AssetImage("assets/image/icon/down.png"),
                color: Colors.black,
                size: primary_text_fontSize * 1.3,
              )
            )
          )
          
        ],
      ),
      Container(
          height: MediaQuery.of(context).size.height -
              (primary_text_fontSize * 2 +
                  primary_padding * 26 +
                  primary_title_fontSize_selected * 2),
          child: TabBarView(controller: _channelController, children: [
            for (int i = 0; i < myChannel.length; i++)
              // Text("${myChannel[i]}页面")
              TabPageWidget(key: PageStorageKey("$i"))
          ]))
    ]);
  }
}

// 发现页
class Discoveries extends ConsumerStatefulWidget {
  const Discoveries({super.key});

  @override
  // ignore: library_private_types_in_public_api
  ConsumerState<ConsumerStatefulWidget> createState() => _DiscoveriesState();
}

class _DiscoveriesState extends ConsumerState<Discoveries> {
  @override
  Widget build(BuildContext context) {
    bool _isEditChannel = ref.watch(IsEditChannal);
    return Scaffold(
        // body: _isEditChannel ? const EditChannel() : const Channel(),
        body: Consumer(builder: (context, ref, _) {
      // if(_isEditChannel){
      //   return EditChannel();
      // }
      // else{
      //   return Channel();}
      return Container(
          color: const Color(primary_white),
          child: _isEditChannel ? EditChannel() : const Channel());
    }));
  }
}
