import 'dart:math';

import 'package:expense/Componets/transaction_form.dart';
import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Nova Transação',
      value: 350.56,
      date: DateTime.now(),
    ),
    Transaction(
      id: '{t2}',
      title: 'Nova Transação 2 ',
      value: 1000.56,
      date: DateTime.now(),
    ),
   
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
