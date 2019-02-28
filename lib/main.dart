import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator/calculator_bloc.dart';
import 'package:flutter_calculator/calculator/calculator_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          actions: <Widget>[
            PopupMenuButton<dynamic>(
              onSelected: (value) {
                if (value == 0) {
                  exit(0);
                }
                print("value:  $value");
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.close),
                        Expanded(
                          child: Center(
                            child: Text("Close app"),
                          ),
                        )
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Icon(Icons.info),
                  ),
                ];
              },
            )
          ],
        ),
        body: CalculatorPage(
          bloc: CalculatorBloc(),
        ),
      ),
    );
  }
}
