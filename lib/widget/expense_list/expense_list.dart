import 'package:flutter/material.dart';
import 'package:etracker/Models/expense.dart';
import 'package:etracker/widget/expense_list/expense_item.dart';

class ExpenseList extends StatelessWidget{

  ExpenseList({super.key,required this.expenses,required this.onRemoveExpense});

  final void Function(Expense expense) onRemoveExpense;

  final List<Expense> expenses;

  @override
  Widget build(context) {
    return ListView.builder(itemCount: expenses.length,
    itemBuilder: (cntx,index) => Dismissible(
      key: ValueKey(expenses[index]),
      onDismissed: (direction) {
        onRemoveExpense(expenses[index]);
      },
      child: ExpenseItem(expenses[index]))
    );
  }
}