// 关注

// 关注页
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intelligent_customer_service/public_unit/waterfalls.dart';
import 'package:intelligent_customer_service/static/style.dart';

class Concerns extends ConsumerStatefulWidget {
  Concerns({super.key});

  @override
  // ignore: library_private_types_in_public_api
  ConsumerState<ConsumerStatefulWidget> createState() => _ConcernsState();
}

class _ConcernsState extends ConsumerState<Concerns> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(primary_white),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            WaterFalls()
          ]
        ),
      )
    );
  }
}