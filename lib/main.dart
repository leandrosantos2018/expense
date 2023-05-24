import 'dart:math';
import 'package:flutter/material.dart';
import '../models/Transaction.dart';

import 'Componets/transaction_form.dart';
import 'Componets/transaction_list.dart';

void main(List<String> args) {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Color.fromARGB(255, 14, 85, 236)),
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                    titleMedium: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                )),
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'Nova Transação',
    //   value: 350.56,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '{t2}',
    //   title: 'Nova Transação 2 ',
    //   value: 1000.56,
    //   date: DateTime.now(),
    // ),
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

    Navigator.of(context).pop();
  }

  _opentranscactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Despesas Pessoais',
          style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => _opentranscactionFormModal(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView(children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          width: double.infinity,
          child: const Card(
            color: Colors.blue,
            child: Text('Grafico'),
            elevation: 5,
          ),
        ),
        TransactionList(_transactions),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _opentranscactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
