import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) OnSubmit;

  TransactionForm(this.OnSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titlecontroller = TextEditingController();

  final _valuecontroller = TextEditingController();

  DateTime? _SelectDate = DateTime.now();

  _submitForm() {
    final title = _titlecontroller.text;
    final value = double.parse(_valuecontroller.text) ?? 0.0;
    if (title.isEmpty || value <= 0 || _SelectDate == null) {
      return;
    }
    widget.OnSubmit(title, value, _SelectDate as DateTime);
  }

  _ShowDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickeddate) {
      if (pickeddate == null) {
        print('Data não selecioanda');
        return;
      }

      setState(() {
        _SelectDate = pickeddate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: Container(
        child: Card(
          elevation: 5,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _titlecontroller,
                    decoration: const InputDecoration(
                      labelText: 'Título',
                    ),
                  ),
                  TextField(
                    controller: _valuecontroller,
                    decoration: const InputDecoration(labelText: 'Valor (R\$)'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (value) => _submitForm(),
                  ),
                  Container(
                    height: 70,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(_SelectDate == null
                              ? 'nehuma data Selecionada'
                              : 'Data Selecionada ${DateFormat('dd/MM/yyyy').format(_SelectDate as DateTime)}'),
                        ),
                        TextButton(
                            onPressed: _ShowDatePicker,
                            child: Text(
                              'Selecionar Data',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                      ],
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    ElevatedButton(
                      child: const Text(
                        'Nova Transação',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _submitForm,
                    ),
                  ])
                ],
              )),
        ),
      ),
    );
  }
}
