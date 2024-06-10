import 'package:calendar_app/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  // 선택된 날짜
  DateTime _isSelectedDay = DateTime.now();
  // 현재 보여지는 달을 결정
  DateTime _focusday = DateTime.now();

  @override
  void initState() {
    // 현재 날짜의 할일을 가져옴
    // _bloc.getTiemWithDate(CommonMethod.dateFormatToString(DateTime.now()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2024, 01, 01),
      lastDay: DateTime.utc(2024, 12, 31),
      locale: 'ko_KR',
      focusedDay: _focusday,
      headerStyle:
          const HeaderStyle(titleCentered: true, formatButtonVisible: false),
      calendarStyle: const CalendarStyle(
        weekendTextStyle: TextStyle(color: Colors.blue),
      ),
      selectedDayPredicate: (day) {
        return isSameDay(_isSelectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _isSelectedDay = selectedDay;
          _focusday = focusedDay;
        });
      },
    );
  }
}
