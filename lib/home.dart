import 'package:flutter/material.dart';

class Transaction {
  final String date;
  final String category;
  final String item;
  final int amount;
  final String payment;
  final String transactionType;
  final String memo;

  Transaction({
    required this.date,
    required this.category,
    required this.item,
    required this.amount,
    required this.payment,
    this.transactionType = '지출',
    this.memo = '',
  });
}

class TransactionApp extends StatefulWidget {
  @override
  _TransactionAppState createState() => _TransactionAppState();
}

class _TransactionAppState extends State<TransactionApp> {
  List<Transaction> transactions = [
    // 실제 데이터로 채워넣을 부분
    Transaction(
      date: '2024-09-12',
      category: '식비',
      item: '저녁 식사',
      amount: 15000,
      payment: '카드',
      transactionType: '지출',
    ),
    // ... 더 많은 거래 내역
  ];

  // 탭 상태 관리
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('일별'),
    Text('달별'),
    Text('카테고리별'),
    Text('검색'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('지출 내역'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return ListTile(
            leading: Text(transaction.date),
            title: Text(transaction.item),
            subtitle: Text('${transaction.category} · ${transaction.payment}'),
            trailing: Text('-${transaction.amount}원'),
          );
        },
      ),

      // _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            backgroundColor: Colors.black,
            label: '일별',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: '달별',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: '카테고리별',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
