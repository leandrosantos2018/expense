
import 'package:flutter/material.dart';

class BaneZeroItem extends StatelessWidget {
  const BaneZeroItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Nenhuma Transação Cadastrada!',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            child: Image.asset(
              'assets\\images\\waiting.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      );
  }
}