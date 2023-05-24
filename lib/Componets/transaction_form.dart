import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) OnSubmit;

  TransactionForm(this.OnSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titlecontroller = TextEditingController();

  final _valuecontroller = TextEditingController();

  _submitForm() {
        final title = _titlecontroller.text;
        final value = double.parse(_valuecontroller.text) ?? 0.0;
        if(title.isEmpty || value <=0){
              return;
                }
        widget.OnSubmit(title, value);
           }

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
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (value)=>_submitForm(),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(
                      child: Text('Nova Transação'),
                      onPressed: _submitForm,
                )])
              ],
            )),
      ),
    );
  }
}
