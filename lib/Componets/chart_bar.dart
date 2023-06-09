import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String? label;
  final double value;
  final double? percentage;

  ChartBar({
    this.label,
    this.value = 0.0,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(child: Text('${(value.toStringAsFixed(2))}'))),
       const SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 0, 0, 0),
                      
                      width: 1.0,
                    ),
                    color: Color.fromARGB(220, 255, 255, 255),
                    borderRadius: BorderRadius.circular(5)),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(5)),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label ?? 'default',
        ),
      ],
    );
  }
}
