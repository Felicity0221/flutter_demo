// 附近
// ignore: depend_on_referenced_packages
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intelligent_customer_service/public_unit/waterfalls.dart';
import 'package:intelligent_customer_service/static/style.dart';
import 'package:intelligent_customer_service/store/index_provider.dart';
import 'package:intelligent_customer_service/store/public_provider.dart';
// import 'package:location/location.dart';


// 开启定位权限
// 申请定位开启
// _checkLocationService() async{
//   bool serviceEnabled;
//   LocationPermission permission;

//   // 检查定位服务是否启用
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return "";
//   }

//   // 请求定位权限
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
//       try {
//         Position? _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//         List<Placemark> placemarks = await placemarkFromCoordinates( _currentPosition.latitude, _currentPosition.longitude);
//         if (placemarks.isNotEmpty) {
//           Placemark place = placemarks[0];
//           // setState(() {
//           //   _locationMessage = "${place.street}, ${place.locality}, ${place.country}";
//           // });
//           return place.locality;
//         }
//       } catch (e) {
//         print("_getCurrentLocation error: $e");
//         return "";
//       }
//     }
//   }
// }
// // 获取定位
// _getCurrentLocation() async {
//     try {
//       Position? _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       // setState(() {
//       //   _locationMessage = "当前定位:\n经度: ${_currentPosition?.longitude}\n纬度: ${_currentPosition?.latitude}";
//       // });
//       // 经度，纬度
//       // return [_currentPosition?.longitude, _currentPosition?.latitude];
//       List<Placemark> placemarks = await placemarkFromCoordinates( _currentPosition.latitude, _currentPosition.longitude);
//       if (placemarks.isNotEmpty) {
//         Placemark place = placemarks[0];
//         // setState(() {
//         //   _locationMessage = "${place.street}, ${place.locality}, ${place.country}";
//         // });
//         return place.locality;
//       }
//     } catch (e) {

//       print("_getCurrentLocation error: $e");
//       return "";
//       // setState(() {
//       //   _locationMessage = "获取位置失败: $e";
//       // });
//     }
//   }


class EnableLocationAccess extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: primary_title_fontSize_selected + primary_padding,
      color: Color(primary_white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: primary_padding/2, horizontal: primary_padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/image/icon/location.png",
                  width: primary_text_fontSize,
                  height: primary_text_fontSize*2,
                ),
                const Text(
                  "开启定位权限，发现更多本地好内容",
                  style: TextStyle(
                    color: Color(selected),
                    fontWeight: FontWeight.w600,
                    fontSize: primary_text_fontSize
                  )
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: primary_padding/2, horizontal: primary_padding/2),
            child: TextButton(
              style: const ButtonStyle(
                alignment: Alignment.center,
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
                backgroundColor: WidgetStatePropertyAll(Color(primary_white)),
                overlayColor: WidgetStatePropertyAll<Color>(Colors.transparent),
                shadowColor: WidgetStatePropertyAll<Color>(Colors.transparent),
              ),
              onPressed: ()async{
                // String _position = _getCurrentLocation();
                // if(_position==""){
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       content: Text("定位获取失败，请确定定位信息是否开启")
                //     )
                //   );
                // }
                // ref.read(NeighboringLocation.notifier).update((state)=>_position);

 
                // bool isLocationServiceEnabled  = await Geolocator.isLocationServiceEnabled();
                // print("isLocationServiceEnabled:$isLocationServiceEnabled");


                // Location location = new Location();

                // bool _serviceEnabled;
                // PermissionStatus _permissionGranted;

                // _serviceEnabled = await location.serviceEnabled();
                // if (!_serviceEnabled) {
                //   _serviceEnabled = await location.requestService();
                //   if (!_serviceEnabled) {
                //     // return null;
                //   }
                // }

                // _permissionGranted = await location.hasPermission();
                // if (_permissionGranted == PermissionStatus.denied) {
                //   _permissionGranted = await location.requestPermission();
                //   if (_permissionGranted != PermissionStatus.granted) {
                //     // return null;
                //   }
                // }
              },
              child: Text("开启",style: TextStyle(color: Colors.blue[800]))
            ),
          )
          

        ],
      ),
    );
    
  }

}

class TabList{
  late String icon;
  late String name;

  TabList(String icon, String name){
    this.icon = icon;
    this.name = name;
  }
}

class Neighboring extends ConsumerStatefulWidget {
  Neighboring({super.key});

  @override
  // ignore: library_private_types_in_public_api
  ConsumerState<ConsumerStatefulWidget> createState() => _NeighboringState();
}

class _NeighboringState extends ConsumerState<Neighboring> {

  late String _NeighboringLocation = ref.watch(NeighboringLocation);

  final List<TabList> _tabList = [
    TabList("assets/image/icon/food.png", "美食"),
    TabList("assets/image/icon/playing.png", "玩乐"),
    TabList("assets/image/icon/landscaping.png", "景点"),
    TabList("assets/image/icon/sport.png", "运动"),
    TabList("assets/image/icon/map.png", "地图")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(primary_white),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _NeighboringLocation == "" ?  EnableLocationAccess(): SizedBox(width: 0,height: 0,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: primary_padding/2, horizontal: primary_padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: 
                  _tabList.map((tab)=>
                    FilledButton(
                      style: const ButtonStyle(
                        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: primary_padding, horizontal: primary_padding/2)),
                        backgroundColor: WidgetStatePropertyAll<Color>(Colors.transparent),
                        alignment: Alignment.center,
                        overlayColor: WidgetStatePropertyAll<Color>(Colors.transparent),
                        shadowColor: WidgetStatePropertyAll<Color>(Colors.transparent),
                        side: WidgetStatePropertyAll<BorderSide>(BorderSide(color: Colors.transparent, width: 0)),
                        iconColor: WidgetStatePropertyAll<Color>(Colors.transparent),
                      ),
                      onPressed: (){}, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            tab.icon,
                            width: primary_text_fontSize*3,
                            height: primary_text_fontSize*3,
                          ),
                          Text(
                            tab.name,
                            style: const TextStyle(
                              color: Color(selected),
                              fontSize: primary_text_fontSize,
                              fontWeight: FontWeight.w400,
                            )
                          ),
                        ],
                      )
                    )
                  ).toList(),
              ),
            ),
            WaterFalls()
          ]
        ),
      )
    );
  }
}