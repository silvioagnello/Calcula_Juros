import 'package:calcula_juros/bloc/atualiza_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class AportWidget extends StatelessWidget {
  Function funcCalled;
  MoneyMaskedTextController valMontante;
  MoneyMaskedTextController valController2; //(leftSymbol: 'R\$ ');
  MoneyMaskedTextController valIncluded;  //(leftSymbol: 'R\$ ');
  // double valMontante;
  // double valAporte;
  AportWidget({this.valMontante, this.valController2, this.valIncluded}); //, this.funcCalled});

  AtualizaBloc atualizaBloc = AtualizaBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(50),
      ),
      width: 330,
      child: Column(
        children: <Widget>[
          Text(
            "Aportes",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(border: InputBorder.none),
            controller: valController2,
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 33, color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  onPressed: () {
                    // funcCalled(valMontante, valController2, valIncluded),
                    atualizaBloc.atualizaMontante(
                        valMontante, valController2, valIncluded);
                  }, //
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "APORTAR",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  )),
              RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text("LIMPAR",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontStyle: FontStyle.italic)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
