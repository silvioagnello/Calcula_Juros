import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class PercentWidget extends StatelessWidget {
  PercentWidget({
    @required this.perController,
  });

  final MoneyMaskedTextController perController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Percentual",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w700, fontSize: 20)),
        TextFormField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(border: InputBorder.none),
          // textAlign: TextAlign.center,
          controller: perController,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 33, color: Colors.black),
        ),
      ],
    );
  }
}
