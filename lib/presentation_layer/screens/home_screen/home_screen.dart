import 'package:flutter/material.dart';
import 'package:flutter_sql_riverpod_example_v2/presentation_layer/screens/home_screen/widgets/header_text.dart';
import 'package:flutter_sql_riverpod_example_v2/presentation_layer/screens/home_screen/widgets/tasks_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sql+Riverpod'),
      ),
      body: const Column(
        children: [
          HeaderText(
            title: 'Tasks',
          ),
          Expanded(
            child: TasksList(false),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // TODO navigate to next page
        },
      ),
    );
  }
}
