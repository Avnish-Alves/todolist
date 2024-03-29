import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

   ToDoList({super.key,
     required this.taskName,
     required this.taskCompleted,
     required this.onChanged,
     required this.deleteFunction,
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction,icon: Icons.delete,backgroundColor: Colors.purple,borderRadius: BorderRadius.circular(100),)
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
        
              //checkbox
              Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Colors.pink[100],),
        
              //task name
              Text(taskName,
              style: TextStyle(decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(color: Colors.pink[50],borderRadius: BorderRadius.circular(12)
          ),
        ),
      ),
    );
  }
}
