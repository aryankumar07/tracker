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
      isScrollControlled: true ,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense) );
  }

  void _addExpense(Expense expense){
    setState(() {
      _registerdExpense.add(expense); 
    });
  }

  void _removeExpense(Expense expense){
    final expenseIndex = _registerdExpense.indexOf(expense);
    setState(() {
      _registerdExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      content: Text("Expense delted"),
      action: SnackBarAction(label: "Undo",
       onPressed: () {
        setState(() {
          _registerdExpense.insert(expenseIndex, expense);
        });
       }),
      ));
  }

@override
  Widget build(context) {

    Widget mainContent = Center(child: Text("Nothing added yet"),);

    if(_registerdExpense.isNotEmpty){
      mainContent = ExpenseList(expenses: _registerdExpense ,
            onRemoveExpense: _removeExpense,);
            
    }

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
            child: mainContent
          )
        ],
      ),
    );
  }

}