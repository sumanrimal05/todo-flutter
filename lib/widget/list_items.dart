import 'package:flutter/material.dart';
import 'package:flutter_todo/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class ListItems extends StatelessWidget {
  const ListItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.watch<TodoModel>().listItems[index].value),
                IconButton(
                  onPressed: () {
                    context.read<TodoModel>().deleteSelected(index);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: context.watch<TodoModel>().listItems.length,
    );
  }
}
