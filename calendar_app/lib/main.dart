import 'package:calendar_app/components/calendar.dart';
import 'package:calendar_app/components/todo_list_widget.dart';
import 'package:calendar_app/db/database.dart';
import 'package:calendar_app/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

void main() async {
  // main함수를 비동기로 실행시 필요한 함수
  WidgetsFlutterBinding.ensureInitialized();
  // 다국어지원 함수 초기화
  await initializeDateFormatting();
  final database = AppDatabase();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: CustomCalendar()),
              Expanded(
                flex: 1,
                child: TodoListWidget(),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    child: Column(
                      children: [],
                    ),
                  );
                });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
