import 'dart:async';

import 'package:flutter_masked_text/flutter_masked_text.dart';

class AtualizaBloc {
  MoneyMaskedTextController montante =
      MoneyMaskedTextController(leftSymbol: 'R\$ ');

  double valMontante;
  double valMontante0;
  double valMontante1;
  double valAporte;
  double valPercent;
  int numMes;

  final StreamController _streamController = StreamController.broadcast();
  Sink get input => _streamController.sink;
  Stream get output => _streamController.stream;

  void dispose() {
    _streamController.close();
  }

  limpaAporte(valController) {
    valMontante = 0;
    valController.updateValue(valMontante);
  }

  resetAllValues(perController, valController, valController2,
      MoneyMaskedTextController montante) {
    valMontante = 0;
    perController.updateValue(valMontante);
    valController.updateValue(valMontante);
    valController2.updateValue(valMontante);
    montante.updateValue(valMontante);
  }

  calculaMontante(perController, valMontante, String sinal, int numMes) {
    valMontante0 = valMontante.numberValue;
    valPercent = perController.numberValue;
    if (numMes >= 0) {
      if (sinal == '+') {
        valMontante1 = (valMontante0 * ((100 + valPercent) / 100));
      } else if (numMes > 0) {
        valMontante1 = (valMontante0 / ((100 + valPercent) / 100));
      }
    } else {
      valMontante1 = valMontante0;
    }

    valMontante.updateValue(valMontante1);
  }

  atualizaMontante(perController, numMes, valController, valController2,
      MoneyMaskedTextController montante, String sinal) {
    valAporte = valController2.numberValue;
    valMontante0 = valController.numberValue;
    valPercent = perController.numberValue;
    if (sinal == '+') {
      valMontante = valMontante0 + valAporte;
    } else {
      valMontante0 = valMontante0 - valAporte;
      valMontante = (valMontante0 / ((100 + valPercent) / 100));
    }
    montante.updateValue(valMontante);
    valController = montante;
    input.add(montante);
  }
}
