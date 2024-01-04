import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todolist/data/database.dart';

import '../util/dialog_box.dart';
import '../util/todolist.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  }
  class _HomePageState extends State<HomePage>{
  //reference hive box
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    super.initState();
    // Replace with your actual implementation
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.LoadData();
    }
  }

  //text controller
  final _controller = TextEditingController();



    //checkbox was tapped
    void checkBoxChanged(bool? value,int index){
      setState(() {
        db.todoList[index][1] = !db.todoList[index][1];
      });
      db.UpdateData();

    }

    //savenewtask
    void saveNewTask(){
      setState(() {
        db.todoList.add([_controller.text,false]);
        _controller.clear();
      });
      db.UpdateData();
      Navigator.of(context).pop();

    }

    //delete task
    void deleteTask(int index){
      setState(() {
        db.todoList.removeAt(index);
      });
      db.UpdateData();

    }


    //new task
    void createNewTask(){
      showDialog(
          context: context,
          builder: (context){
            return DialogBox(
              controller: _controller ,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop(),
            );
          }
      );

    }

    @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Colors.pink[200],
        appBar: PreferredSize(preferredSize: Size.fromHeight(80.0),
          child: AppBar(
          title: Padding(padding: EdgeInsets.only(top: 28.0),
          child: Text('TO DO',
            style: TextStyle(
                color: Colors.pink[200],
                fontFamily:'Roboto',
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          ),
          ),
          backgroundColor: Colors.pink[500],
          elevation: 0,
          centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),

        ),

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100)
            )
          ),
        ),
        body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index){
            return ToDoList(taskName: db.todoList[index][0],
              taskCompleted: db.todoList[index][1],
              onChanged: (value)=> checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index) ,

            );
          }


        ),
      );
  }




}