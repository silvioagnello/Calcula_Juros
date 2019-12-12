import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class MontanteWidget extends StatelessWidget {
  // MoneyMaskedTextController valIncluir;
  MoneyMaskedTextController valController;

  MontanteWidget({@required this.valController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Montante final",
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        TextFormField(
          readOnly: true,
          textAlign: TextAlign.center,
          decoration: InputDecoration(border: InputBorder.none),
          // textAlign: TextAlign.center,
          controller: valController,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 33, color: Colors.black),
        ),
      ],
    );
  }
}
