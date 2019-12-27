import 'package:calcula_juros/bloc/atualiza_bloc.dart';
import 'package:calcula_juros/widgets/Percent.dart';
import 'package:calcula_juros/widgets/montante.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int numMes = 0;
  var perController = MoneyMaskedTextController(rightSymbol: '%');
  MoneyMaskedTextController valMontante =
      MoneyMaskedTextController(leftSymbol: 'R\$');
  MoneyMaskedTextController valController =
      MoneyMaskedTextController(leftSymbol: 'R\$');
  MoneyMaskedTextController valController2 =
      MoneyMaskedTextController(leftSymbol: 'R\$');
  MoneyMaskedTextController valorIncluded =
      MoneyMaskedTextController(leftSymbol: 'R\$');

  void somaMes(value) {
    setState(() {
      if ((numMes >= 0 && value > 0) || (numMes > 0 && value < 0)) {
        numMes += value;
      }
    });
  }

  void percentualizar( MoneyMaskedTextController valController, MoneyMaskedTextController valController2) {
    double valMaior = 0.00;
    double valMenor = 0.00;
    double valCalculo = 0.00;
    valMaior = valController.numberValue;
    valMenor = valController2.numberValue;
    valCalculo = ((valMaior - valMenor) / valMenor) * 100;
    setState(() {
      perController.updateValue(valCalculo);
    });
  }

  void limpaMes() {
    setState(() {
      numMes = 0;
    });
  }

  AtualizaBloc atualizaBloc = AtualizaBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Calcula Juros"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  limpaMes();
                  atualizaBloc.resetAllValues(perController, valMontante,
                      valController2, valorIncluded);
                })
          ]),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50),
          PercentWidget(perController: perController),
          RaisedButton(
            child: Text(
              "Porcentualizar",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: () {
              percentualizar(valMontante, valController2);
            }, //
          ),
          SizedBox(height: 60),
          Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(50),
            ),
            width: 330,
            child: Column(
              children: <Widget>[
                Text(
                  "Mont.Inicial ou Aportes",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
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
                      child: Text(
                        "APORTAR",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {
                        atualizaBloc.atualizaMontante(perController, numMes,
                            valMontante, valController2, valorIncluded, '+');
                      }, //
                    ),
                    RaisedButton(
                      onPressed: () {
                        atualizaBloc.limpaAporte(valController2);
                        atualizaBloc.atualizaMontante(perController, numMes,
                            valMontante, valController2, valorIncluded, '+');
                      },
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
          ),
          SizedBox(height: 70),
          StreamBuilder(
              stream: atualizaBloc.output,
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  valMontante = snapshot.data;
                }
                return MontanteWidget(valController: valMontante);
              }),
          SizedBox(height: 30),
          // CalculaWidget(),
          Container(
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(50)),
            width: 330,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    onPressed: () {
                      atualizaBloc.calculaMontante(
                          perController, valMontante, '+', numMes);
                      atualizaBloc.atualizaMontante(perController, numMes,
                          valMontante, valController2, valorIncluded, '+');
                      somaMes(1);
                    },
                    child: Text("+1 MÊS",
                        style: TextStyle(color: Colors.black, fontSize: 20))),
                SizedBox(width: 50),
                RaisedButton(
                    onPressed: () {
                      if (numMes > 0) {
                        atualizaBloc.atualizaMontante(perController, numMes,
                            valMontante, valController2, valorIncluded, '-');
                      }
                      somaMes(-1);
                    },
                    child: Text("-1 MÊS",
                        style: TextStyle(color: Colors.black, fontSize: 20))),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Text("Qtd.Meses:$numMes",
              style: TextStyle(color: Colors.blue, fontSize: 20)),
        ],
      )),
    );
  }
}
