import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final _titlecontroller = TextEditingController();
  final _valuecontroller = TextEditingController();
  final void Function(String, double) OnSubmit;

  TransactionForm(this.OnSubmit);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _titlecontroller,
                  decoration: InputDecoration(
                    labelText: 'Título',
                  ),
                ),
                TextField(
                  controller: _valuecontroller,
                  decoration: InputDecoration(labelText: 'Valor (R\$)'),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(
                      child: Text('Nova Transação'),
                      onPressed: () {
                        final title = _titlecontroller.text;
                        final value = double.parse(_valuecontroller.text) ?? 0.0;
                        OnSubmit(title, value);
                      }),
                ])
              ],
            )),
      ),
    );
  }
}
