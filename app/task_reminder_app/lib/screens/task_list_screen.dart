import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [
    Task(
      id: '1',
      title: 'Finish Software Engineering doc',
      category: 'school',
      priority: 4,
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
      dueAt: DateTime.now().add(const Duration(days: 1)),
    ),
    Task(
      id: '2',
      title: 'Go to gym',
      category: 'personal',
      priority: 2,
      createdAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    tasks.sort((a, b) => b.priority.compareTo(a.priority));

    return Scaffold(
      appBar: AppBar(title: const Text("Task Reminder")),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final t = tasks[index];
          return Card(
            child: ListTile(
              title: Text(t.title),
              subtitle: Text("Category: ${t.category} | Priority: ${t.priority}"),
              trailing: Checkbox(
                value: t.isComplete,
                onChanged: (val) {
                  setState(() {
                    tasks[index] = t.copyWith(isComplete: val);
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
