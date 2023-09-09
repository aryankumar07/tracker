import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewExpense extends StatefulWidget{

NewExpense({super.key});

@override
  State<NewExpense> createState() {
    
    return _NewExpenseState();
  }

}


class _NewExpenseState extends State<NewExpense>{


final _titleController = TextEditingController();
final _amountController = TextEditingController();


void _presentDatePicker(){
  final now = DateTime.now();
  final firstDate = DateTime( now.year - 1,now.month,now.day);

   showDatePicker(context: context, initialDate: now, firstDate: firstDate, lastDate: now);
}

@override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }


@override
  Widget build(context) {

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
         TextField(
          controller: _titleController,
          maxLength: 50,
          decoration: InputDecoration(
            label: Text("title")
          ),
         ),
         Row(
          children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixText: "\$",
                  label: Text("Amount")
                ),
                      ),
            ),
          SizedBox(width: 16,),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Selected Date"),
                IconButton(
                  onPressed: _presentDatePicker,
                 icon: Icon(
                  Icons.calendar_month,
                 ))
              ],
            ),
          )
          ],
         ),
         Row(
          children: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            },
             child: Text("Cancel")),
            ElevatedButton(onPressed: () {
              print(_titleController.text);
            },
             child: Text("Save Expense"))
          ],
         )
        ],
      ),
    );
    
  }

}