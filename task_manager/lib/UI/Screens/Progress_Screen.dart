import 'package:flutter/material.dart';
import 'package:task_manager/UI/weidgets/Task_card.dart';

class Progresstaskscreen extends StatefulWidget {
  const Progresstaskscreen({super.key});

  @override
  State<Progresstaskscreen> createState() => _ProgresstaskscreenState();
}

class _ProgresstaskscreenState extends State<Progresstaskscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Expanded(
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
      ),
    );
  }
}
