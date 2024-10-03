import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseInputScreen extends StatefulWidget {
  const ExpenseInputScreen({super.key});

  @override
  _ExpenseInputScreenState createState() => _ExpenseInputScreenState();
}

class _ExpenseInputScreenState extends State<ExpenseInputScreen> {
  DateTime _selectedDate = DateTime.now();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _saveExpense() {
    // 여기에 지출 정보 저장 로직 추가
    // 예: Firebase Firestore에 저장
    print('저장된 정보:');
    print('날짜: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}');
    print('금액: ${_amountController.text}');
    print('카테고리: ${_categoryController.text}');
    // ... 다른 정보 출력
  }

  void _continueToNextScreen() {
    // 다음 화면으로 이동하는 로직 추가
    // 예: Navigator.push()를 사용하여 다른 화면으로 이동
    print('다음 화면으로 이동');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('지출 입력'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: '금액'),
              ),
              Row(
                children: [
                  Text(
                    '날짜: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}',
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ],
              ),
              TextField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: '카테고리'),
              ),
              TextField(
                controller: _accountController,
                decoration: InputDecoration(labelText: '계좌'),
              ),
              TextField(
                controller: _noteController,
                decoration: InputDecoration(labelText: '메모'),
                maxLines: 3,
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: '설명'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _saveExpense,
                    child: Text('저장'),
                  ),
                  ElevatedButton(
                    onPressed: _continueToNextScreen,
                    child: Text('계속'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
