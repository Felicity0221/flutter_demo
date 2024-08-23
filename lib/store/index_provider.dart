import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intelligent_customer_service/views/index/neighboring.dart';

// 首页导航栏
final IndexTabLevel = StateProvider((ref)=> 1);

// 首页滚动记录
final Bucket = Provider((ref)=>PageStorageBucket());

// 首页/发现页
// - 频道
final ChannelTabLevel = StateProvider((ref)=>0);

// - 是否修改频道
final IsEditChannal = StateProvider((ref)=>false);

// - 频道列表
final ChannelList = StateProvider((ref)=> [
  "动漫",
  "美食",
  "绘画",
  "手工",
  "穿搭",
  "游戏",
  "头像",
  "艺术",
  "美甲",
  "家装",
  "读书",
  "潮玩手办",
  "影视",
  "情感",
  "壁纸",
   "搞笑",
  "萌宠",
  "科技数码",
  "文具手账",
  "明星",
  "科学科普",
  "汽车",
  "校园生活",
  "家居",
  "机车",
  "旅行",
  "学习",
  "摄影",
  "发型",
  "婚礼",
  "舞蹈",
  "箱包",
  "潮鞋",
  "综艺",
  "露营",
  "社科",
  "彩妆",
  "心理",
  "运动",
  "母婴",
  "户外",
  "职场",
  "减脂",
  "护肤",
  "健身塑形"
]);

// - 已选频道
final SelectedChannel = StateProvider((ref)=>[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]);
// - 未选频道
final NoSelectChannel = StateProvider((ref)=>[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44]);
