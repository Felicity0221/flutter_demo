// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
import 'package:intelligent_customer_service/static/style.dart';

// 单个帖子样式
CardItem(String imgUrl, String title, String name, String avatar,int likes, BuildContext ctx){
  return Container(
    width: ((MediaQuery.of(ctx).size.width*0.5)),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
    // 卡片
    child: Card(
      color: const Color(primary_white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)), // 调整圆角半径
      shadowColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 图片
          Image.network(
            "$imgUrl",
            repeat: ImageRepeat.repeatX,
            errorBuilder: (context,_, StackTrace)=> Image.asset("assets/image/no_img.jpg"),
            loadingBuilder: (context,_, StackTrace) => Image.asset("assets/image/loading.gif"),
          ),
          // 标题
          Padding(
            padding: const EdgeInsets.all(primary_padding),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "$title",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Color(selected),
                  fontSize: primary_title_fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          // 用户&赞
          Padding(
            padding: const EdgeInsets.all(primary_padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 用户
                RawChip(
                  backgroundColor: const Color(primary_white),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side:BorderSide(color: Color(primary_white)),
                  ),
                  label: Text(
                    "$name",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(no_seleted),
                      fontSize: primary_text_fontSize/1.3,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  avatar: CircleAvatar(
                    backgroundColor: const Color(primary_img_bgcolor),
                    foregroundImage: NetworkImage("$imgUrl"),
                    radius: primary_text_fontSize,
                  ),
                ),
                // 赞
                OutlinedButton.icon(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.transparent),
                    side: WidgetStatePropertyAll<BorderSide>(
                      BorderSide(color: Colors.transparent,width: 0)
                    ),
                    foregroundColor: WidgetStatePropertyAll<Color>(Colors.transparent),
                    overlayColor: WidgetStatePropertyAll<Color>(Colors.transparent),
                  ),
                  onPressed: (){},
                  // icon: const Icon(CupertinoIcons.heart,color: Color(no_seleted),size: primary_text_fontSize/1.3,),
                  icon: const ImageIcon(
                    AssetImage("assets/image/icon/like.png"),
                    color: Color(no_seleted),
                    size: primary_text_fontSize,
                  ),
                  label: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "$likes",
                      style: const TextStyle(
                        color: Color(no_seleted),
                        fontSize: primary_text_fontSize/1.3,
                        fontWeight: FontWeight.w400
                      ),
                  ),),
                )
              ],
            ),
          )
        ],
      )
    ),
  );
  

}

class Info {
  late String imgUrl;
  late String title;
  late String name;
  late String avatar;
  late int likes;
  // late BuildContext ctx;
  Info({required String imgUrl, required String title, required String name, required String avatar, required int likes,}){
    this.imgUrl = imgUrl;
    this.title = title;
    this.name = name;
    this.avatar = avatar;
    this.likes = likes;
    // this.ctx = ctx;
  }
}

// 瀑布流
class WaterFalls extends StatelessWidget{
  final List<Info> _left = [
    Info(
      imgUrl: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      title: "1",
      name: "cabbage",
      avatar: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      likes: 15
    ),
    Info(
      imgUrl: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      title: "1",
      name: "cabbage",
      avatar: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      likes: 15
    ),
    Info(
      imgUrl: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      title: "1",
      name: "cabbage",
      avatar: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      likes: 15
    ),
    Info(
      imgUrl: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      title: "1",
      name: "cabbage",
      avatar: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      likes: 15
    ),
    Info(
      imgUrl: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      title: "1",
      name: "cabbage",
      avatar: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      likes: 15
    )
  ];
  final List<Info> _right = [
    Info(
      imgUrl: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      title: "1",
      name: "cabbage",
      avatar: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      likes: 15
    ),
    Info(
      imgUrl: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      title: "1",
      name: "cabbage",
      avatar: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      likes: 15
    ),
    Info(
      imgUrl: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      title: "1",
      name: "cabbage",
      avatar: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      likes: 15
    ),
    Info(
      imgUrl: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      title: "1",
      name: "cabbage",
      avatar: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      likes: 15
    ),
    Info(
      imgUrl: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      title: "1",
      name: "cabbage",
      avatar: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fzh%2Fimages%2Fsearch%2F%25E5%259B%25BE%25E7%2589%2587%2F&psig=AOvVaw3ZP0QOk09cISOJR9oALo56&ust=1723714347817000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLj9l8CW9IcDFQAAAAAdAAAAABAI",
      likes: 15
    )
  ];
  
  WaterFalls({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            for(int i=0; i<_left.length; i++)
              CardItem(_left[i].imgUrl, _left[i].title, _left[i].name, _left[i].avatar, _left[i].likes, context)
          ],
        ),
        Column(
          children: [
            for(int i=0; i<_right.length; i++)
              CardItem(_right[i].imgUrl, _right[i].title, _right[i].name, _right[i].avatar, _right[i].likes, context)
          ],
        )
      ],
    );
  }
}