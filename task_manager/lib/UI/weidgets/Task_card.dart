import 'package:flutter/material.dart';

class Task_Card extends StatelessWidget {
  const Task_Card({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      tileColor: Colors.white,
      title: Text('Title will be here'),
      subtitle: Column(
        spacing: 7,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('description of the task'),
          Text(
            'Date: 12/12/2012',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
          ),
          Row(
            children: [
              Chip(
                label: Text('New'),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white),
                padding: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Spacer(),

              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete, color: Colors.grey),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
