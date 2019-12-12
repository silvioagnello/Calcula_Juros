import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() => runApp(MaterialApp(
      title: 'Calcula Juros',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      home: Home(),
    ));

