import 'dart:async';

import 'package:flutter_masked_text/flutter_masked_text.dart';


class AtualizaBloc {
  // MoneyMaskedTextController montante =
  //     MoneyMaskedTextController(leftSymbol: 'R\$ ');
  // MoneyMaskedTextController valController2 =
  //     MoneyMaskedTextController(leftSymbol: 'R\$ ');
  // MoneyMaskedTextController valController =
  //     MoneyMaskedTextController(leftSymbol: 'R\$ ');
      
  double valMontante;
  double valMontante0;
  double valAporte;
  // var valController = MoneyMaskedTextController(leftSymbol: 'R\$ ');

  // AtualizaBloc(this.valController, this.valController2, this.montante);

  final StreamController _streamController = StreamController();
  Sink get input => _streamController.sink;
  Stream get output => _streamController.stream;

  void dispose() {
    _streamController.close();
  }

  atualizaMontante(valController, valController2, MoneyMaskedTextController montante) {
    valAporte = valController2.numberValue;
    valMontante0 = valController.numberValue;
    valMontante = valMontante0 + valAporte;
    montante.updateValue(valMontante);
    valController = montante;
    input.add(montante);
    
    
  }
}
