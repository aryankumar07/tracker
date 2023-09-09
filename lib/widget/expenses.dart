import 'package:flutter/material.dart';
import 'package:etracker/Models/expense.dart';
import 'package:etracker/widget/expense_list/expense_list.dart';
import 'package:etracker/widget/new_expense.dart';

class Expenses extends StatefulWidget{

Expenses({super.key});

  @override
  State<Expenses> createState() {

    return _ExpensesState();
  }
}


class _ExpensesState extends State<Expenses>{

  final List<Expense> _registerdExpense = [
    Expense(title: "Flutter course",
     amount: 11,
      date: DateTime.now(),
       category: Category.work),
    Expense(title: "Cinema",
     amount: 24,
      date: DateTime.now(),
        category: Category.leisure)
  ];


  void _openAddExpenseOverlay(){
     showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense() );
  }

@override
  Widget build(context) {

    return  Scaffold(
    appBar: AppBar(
      title: Text("Expense Tracker APP"),
      actions: [
        IconButton(
          onPressed: _openAddExpenseOverlay ,
         icon: Icon(Icons.add))
      ],
    ),
      body: Column(
        children: [
          Text("Chart"),
          Expanded(
            child: ExpenseList(expenses: _registerdExpense )
            ),
        ],
      ),
    );
  }

}