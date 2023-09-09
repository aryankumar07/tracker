import 'package:flutter/material.dart';
import 'package:etracker/Models/expense.dart';
import 'package:etracker/widget/expense_list/expense_item.dart';

class ExpenseList extends StatelessWidget{

  ExpenseList({super.key,required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(context) {
    return ListView.builder(itemCount: expenses.length,
    itemBuilder: (cntx,index) => ExpenseItem(expenses[index])
    );
  }
}