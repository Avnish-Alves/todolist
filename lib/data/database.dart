import 'package:hive/hive.dart';

class ToDoDatabase{
  List todoList = [];

  //reference box
  final _myBox = Hive.box('mybox');

  //run this method
  void createInitialData(){
    todoList = [
      ["Example task 1",false],
      ["Example task 2",false],


    ];
  }
  //load the data
  void LoadData(){
    todoList = _myBox.get("TODOLIST");

  }

  //update
  void UpdateData(){
    _myBox.put("TODOLIST", todoList);

  }


}