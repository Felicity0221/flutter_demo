import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:intelligent_customer_service/router.dart';

void main() {
  runApp(const ProviderScope(child:Routers()));
}