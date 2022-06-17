import 'dart:convert';
import 'dart:io';
import 'dart:math' as math show Random;
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as dev;

import 'Pages/counter_cubit.dart';


extension Log on Object { //to log essily
  void log() => dev.log(toString());
}
extension Subscript<T> on Iterable<T> { //to edit the bad code of dart
  T? operator [](int index) => length > index ? elementAt(index) : null;
}





 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  CubitCounterPage()
    );
  }
}
