import 'dart:async';

import 'package:flutter_masked_text/flutter_masked_text.dart';

class AtualizaBloc {
  MoneyMaskedTextController montante =
      MoneyMaskedTextController(leftSymbol: 'R\$ ');
  // MoneyMaskedTextController valController2 =
  //     MoneyMaskedTextController(leftSymbol: 'R\$ ');
  // MoneyMaskedTextController valController =
  //     MoneyMaskedTextController(leftSymbol: 'R\$ ');

  double valMontante;
  double valMontante0;
  double valMontante1;
  double valAporte;
  double valPercent;
  int numMes;
  // var valController = MoneyMaskedTextController(leftSymbol: 'R\$ ');

  // AtualizaBloc(this.valController, this.valController2, this.montante);

  final StreamController _streamController = StreamController.broadcast();
  Sink get input => _streamController.sink;
  Stream get output => _streamController.stream;

  void dispose() {
    _streamController.close();
  }

  limpaAporte(valController) {
    valMontante = 0;
    valController.updateValue(valMontante);
    // input.add(valController);
  }

  resetAllValues(perController, valController, valController2,
      MoneyMaskedTextController montante) {
    valMontante = 0;
    perController.updateValue(valMontante);
    valController.updateValue(valMontante);
    valController2.updateValue(valMontante);
    montante.updateValue(valMontante);
  }

  calculaMontante(perController, valMontante) {
    valMontante0 = valMontante.numberValue;
    valPercent = perController.numberValue;
    valMontante1 = (valMontante0 * ((100 + valPercent) / 100));
    // valMontante1 = valMontante0 + valMontante1;
    valMontante.updateValue(valMontante1);
    input.add(montante);
  }

  atualizaMontante(
      valController, valController2, MoneyMaskedTextController montante) {
    valAporte = valController2.numberValue;
    valMontante0 = valController.numberValue;
    valMontante = valMontante0 + valAporte;
    montante.updateValue(valMontante);
    valController = montante;
    input.add(montante);
  }
}
