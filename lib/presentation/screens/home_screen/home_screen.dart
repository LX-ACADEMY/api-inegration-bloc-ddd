import 'package:flutter/material.dart';
import 'package:todo_app/presentation/screens/create_todo_screen/create_todo_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with actual todo count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Todo $index'),
            subtitle: Text('Description of Todo $index'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Implement delete logic
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateTodoScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
