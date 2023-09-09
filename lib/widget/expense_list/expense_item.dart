 import 'package:flutter/material.dart';
import 'package:etracker/Models/expense.dart';

class ExpenseItem extends StatelessWidget{

  ExpenseItem(this.expense,{super.key});

  final Expense expense;

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            SizedBox(height: 4,),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(CategoryIcons[expense.category]),
                    const SizedBox(height: 8,),
                    Text(expense.formatedDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}