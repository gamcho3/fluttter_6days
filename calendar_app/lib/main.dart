import 'package:calendar_app/home/home.dart';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  // main함수를 비동기로 실행시 필요한 함수
  WidgetsFlutterBinding.ensureInitialized();
  // 다국어지원 함수 초기화
  await initializeDateFormatting();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
