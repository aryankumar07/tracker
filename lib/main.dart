import 'package:flutter/material.dart';
import 'package:etracker/widget/expenses.dart';

void main(){
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true ),
    home: Expenses(),
  ),
  );
}