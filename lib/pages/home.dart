import 'package:calcula_juros/bloc/atualiza_bloc.dart';
import 'package:calcula_juros/widgets/Percent.dart';
// import 'package:calcula_juros/widgets/calcula.dart';
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

void somaMes() {
  setState(() {
  numMes+= 1;
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
          SizedBox(height: 40),
          Container(
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
                        atualizaBloc.atualizaMontante(
                            valMontante, valController2, valorIncluded);
                      }, //
                    ),
                    RaisedButton(
                      onPressed: () {
                        atualizaBloc.limpaAporte(valController2);
                        atualizaBloc.atualizaMontante(
                            valMontante, valController2, valorIncluded);
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
          SizedBox(height: 90),
          StreamBuilder(
              stream: atualizaBloc.output,
              // initialData: 0 as MoneyMaskedTextController,
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  valMontante = snapshot.data;
                }
                return MontanteWidget(valController: valMontante);
              }),
          SizedBox(height: 20),
          // CalculaWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  onPressed: () {
                    somaMes();
                    atualizaBloc.calculaMontante(perController, valMontante);
                    atualizaBloc.atualizaMontante(
                        valMontante, valController2, valorIncluded);
                  },
                  child: Text("+1 MÊS",
                      style: TextStyle(color: Colors.black, fontSize: 20))),
              SizedBox(width: 50),
              RaisedButton(
                  onPressed: () {},
                  child: Text("-1 MÊS",
                      style: TextStyle(color: Colors.black, fontSize: 20))),
              SizedBox(
                height: 100,
              )
            ],
          ),
          // SizedBox(height: 20),
          Text("Qtd.Meses:$numMes", style: TextStyle(color: Colors.blue, fontSize: 20)),
        ],
      )),
    );
  }
}
