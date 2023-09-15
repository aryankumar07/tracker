import 'package:etracker/Models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:etracker/Models/expense.dart';

class NewExpense extends StatefulWidget{

NewExpense({super.key,required this.onAddExpense});

final void Function(Expense expense) onAddExpense;

@override
  State<NewExpense> createState() {
    
    return _NewExpenseState();
  }

}


class _NewExpenseState extends State<NewExpense>{


final _titleController = TextEditingController();
final _amountController = TextEditingController();
DateTime? _selectedDate;
Category _selectedCategory = Category.leisure;


void _presentDatePicker() async{
  final now = DateTime.now();
  final firstDate = DateTime( now.year - 1,now.month,now.day);

   final pickeddate = await showDatePicker(context: context,
    initialDate: now,
     firstDate: firstDate,
      lastDate: now);

      setState(() {
        _selectedDate = pickeddate;
      });

}

@override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _submitExpenseData(){
    print("enterd in submit");
    final enterdAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enterdAmount == Null; 
    if(_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == Null){
      showDialog(
        context: context,
       builder: (ctx) => AlertDialog(
        title: Text("Invalid Text"),
        content: Text("Please make sure to typed valid information"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
           child: Text("okay"))
        ],
       )
       );
       return ;
    }
    widget.onAddExpense(
      Expense(title: _titleController.text,
     amount: enterdAmount!,
      date: _selectedDate!,
       category: _selectedCategory));
       Navigator.pop(context);
  }


@override
  Widget build(context) {

    return Padding(
      padding: EdgeInsets.fromLTRB(16,48,16,16),
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
                Text(_selectedDate == null ? "No Date Selected" :
                 formatter.format(_selectedDate!),),
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
         const SizedBox(height: 16,),
         Row(
          children: [
            DropdownButton(
              value: _selectedCategory,
              items: Category.values.map((category) => DropdownMenuItem(
                value: category,
                child: 
                Text(category.name.toUpperCase())
                )).toList(),
               onChanged: (value) {
                if(value == Null){
                  return ;
                }
                setState(() {
                  _selectedCategory = value!;
                });
               }),
               const Spacer(),
            TextButton(onPressed: () {
              Navigator.pop(context);
            },
             child: Text("Cancel")),
            ElevatedButton(onPressed: _submitExpenseData,
             child: Text("Save Expense"))
          ],
         )
        ],
      ),
    );
    
  }

}