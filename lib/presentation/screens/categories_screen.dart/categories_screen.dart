import 'package:flutter/material.dart';
import 'package:todo_app/presentation/screens/create_category_screen.dart/create_category_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView.builder(
        itemCount: 5, // Replace with actual category count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Category $index'),
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
            MaterialPageRoute(builder: (context) => CreateCategoryScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
