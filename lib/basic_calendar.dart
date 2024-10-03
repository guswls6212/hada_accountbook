import 'package:flutter/material.dart';

class BasicCalendar extends StatefulWidget {
  @override
  _BasicCalendarState createState() => _BasicCalendarState();
}

class _BasicCalendarState extends State<BasicCalendar> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기본 달력'),
      ),
      body: Center(
        child: Text(
          selectedDate == null ? '날짜를 선택하세요' : selectedDate.toString(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _selectDate(context),
        child: Icon(Icons.calendar_today),
      ),
    );
  }
}
