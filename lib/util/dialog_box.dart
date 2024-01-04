import 'package:flutter/material.dart';
import 'package:todolist/util/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

   DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.pink[100],


      content: Container(height: 200,padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        //get user input
          TextField(
            controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                 Radius.circular(10),
                ),
            ),
            hintText: "Add a new task"
          ),
        ),
            //buttons save and cancel
          Row(
            children: [
              MyButton(text: "Save", onPressed: onSave),
              MyButton(text: "Cancel", onPressed: onCancel)
            ],
          )


      ],) ,
      ),


    );
  }
}
