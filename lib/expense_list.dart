import 'package:flutter/material.dart';
import 'dart:math';

class Expense {
  final String date;
  final String category;
  final String item;
  final int amount;
  final String payment;
  final bool isSubItem;

  Expense({
    required this.date,
    required this.category,
    required this.item,
    required this.amount,
    required this.payment,
    this.isSubItem = false,
  });
}

// dummy리스트생성
List<Expense> generateDummyExpenses() {
  final random = Random();
  final categories = ['식비', '교통', '쇼핑', '문화생활', '기타'];
  final payments = ['카드', '현금'];

  return List.generate(
    20,
    (index) => Expense(
      date: '2023-11-${index + 1}',
      category: categories[random.nextInt(categories.length)],
      item: '${categories[random.nextInt(categories.length)]} 관련 지출',
      amount: random.nextInt(500000) + 10000, // 1만원 ~ 50만원 사이
      payment: payments[random.nextInt(payments.length)],
      isSubItem: index % 3 == 0, // 3번째마다 하위 항목으로 설정
    ),
  );
}

class ExpenseList extends StatefulWidget {
  final List<Expense> expenses;

  const ExpenseList({super.key, required this.expenses});

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  // 검색 기능을 위한 상태 관리
  final TextEditingController _searchController = TextEditingController();
  List<Expense> _filteredExpenses = [];

  @override
  void initState() {
    super.initState();
    _filteredExpenses = List.from(widget.expenses);
  }

  void _filterExpenses(String query) {
    setState(() {
      _filteredExpenses = widget.expenses.where((expense) {
        return expense.item.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('지출 내역'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // 검색 모달 또는 시트를 열기
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 검색 필드
          TextField(
            controller: _searchController,
            onChanged: _filterExpenses,
            decoration: InputDecoration(hintText: '항목 검색'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredExpenses.length,
              itemBuilder: (context, index) {
                final expense = _filteredExpenses[index];
                return Card(
                  child: ListTile(
                    leading: Text(expense.date),
                    title: Text(expense.item),
                    trailing: Text('¥${expense.amount}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('카테고리: ${expense.category}'),
                        Text('결제 수단: ${expense.payment}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
