import 'package:flutter/material.dart';
import 'package:flutter_todo/models/items.dart';
import 'package:flutter_todo/providers/todo_provider.dart';
import 'package:flutter_todo/widget/list_items.dart';
import 'package:provider/provider.dart';

class MyController extends StatefulWidget {
  const MyController({Key? key}) : super(key: key);

  @override
  _MyControllerState createState() => _MyControllerState();
}

class _MyControllerState extends State<MyController> {
  final _myController = TextEditingController();

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(context.watch<TodoModel>().listItems);
    return SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            controller: _myController,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<TodoModel>().addItems(Item(_myController.text));
                  _myController.text = '';
                },
                child: Text('AddTodo'),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<TodoModel>().removeAll();
                },
                child: Text('Remove All'),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ListItems(),
        ],
      ),
    );
  }
}
