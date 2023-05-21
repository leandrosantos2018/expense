import 'package:expense/Componets/transaction_list.dart';
import 'package:expense/models/Transaction.dart';
import 'package:flutter/material.dart';
import 'Componets/transaction_user.dart';

import 'Componets/transaction_form.dart';

void main(List<String> args) {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Despesas Pessoais'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                child: const Card(
                  color: Colors.blue,
                  child: Text('Grafico'),
                  elevation: 5,
                ),
              ),
              TransactionUser()
            ]));
  }
}
