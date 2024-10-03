import 'package:flutter/material.dart';

class StepCalendar extends StatefulWidget {
  const StepCalendar({super.key});

  @override
  _StepCalendarState createState() => _StepCalendarState();
}

class _StepCalendarState extends State<StepCalendar> {
  DateTime _selectedDate = DateTime.now();

  List<DateTime> getDaysInMonth(DateTime month) {
    // 특정 월의 모든 날짜를 리스트로 반환하는 함수
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);
    final daysInMonth = lastDayOfMonth.difference(firstDayOfMonth).inDays + 1;
    print(
        'firstDayOfMonth:$firstDayOfMonth, lastDayOfMonth:$lastDayOfMonth, daysInMonth:$daysInMonth');
    return List.generate(
      daysInMonth,
      (index) => firstDayOfMonth.add(Duration(days: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final days = getDaysInMonth(_selectedDate);

    return Scaffold(
      appBar: AppBar(title: const Text('StepCalendar')),
      body: GridView.count(
        crossAxisCount: 7,
        children: days.map((day) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = day;
              });
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _selectedDate == day ? Colors.blue : Colors.white,
                border: Border.all(color: Colors.grey),
              ),
              child: Text('${day.day}'),
            ),
          );
        }).toList(),
      ),
    );
  }
}
