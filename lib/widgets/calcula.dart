
import 'package:flutter/material.dart';

class CalculaWidget extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(50)),
      width: 330,
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(bottom: 0, top: 10),
              child: Text("Cálcular",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      decoration: TextDecoration.underline))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  onPressed: () {},
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
        ],
      ),
    );
  }
}
