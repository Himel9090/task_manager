import 'package:flutter/material.dart';
import 'package:task_manager/UI/Screens/AddNewTaskScreen.dart';
import 'package:task_manager/UI/weidgets/Task_card.dart';
import 'package:task_manager/UI/weidgets/task_count_by_statuscard.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  void _ontapaddnewtaskbutton() {
    Navigator.push(
      /////nevigation for add new task
      context,
      MaterialPageRoute(builder: (context) => Addnewtaskscreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _ontapaddnewtaskbutton();
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 16,
          children: [
            const SizedBox(height: 16),
            SizedBox(
              height: 96,
              child: ListView.separated(
                itemCount: 4,

                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TaskCountByStatusCard(title: 'New', count: 02);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 4);
                },
              ),
            ),

            Expanded(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Task_Card();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 8);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
