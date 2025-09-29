import 'package:flutter/material.dart';
import 'package:task_manager/UI/weidgets/TM%20AppBar.dart';
import 'package:task_manager/UI/weidgets/screen_background.dart';

class Addnewtaskscreen extends StatefulWidget {
  const Addnewtaskscreen({super.key});

  @override
  State<Addnewtaskscreen> createState() => _AddnewtaskscreenState();
}

class _AddnewtaskscreenState extends State<Addnewtaskscreen> {
  final TextEditingController _subjectTEcontroller = TextEditingController();
  final TextEditingController _descriptionTEcontroller =
      TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _descriptionTEcontroller.dispose();
    _subjectTEcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 33),
                  Text(
                    'Add New Task',
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _subjectTEcontroller,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hint: Text(
                        'Subjet',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _descriptionTEcontroller,
                    textInputAction: TextInputAction.next,
                    maxLines: 7,
                    decoration: InputDecoration(
                      hint: Text(
                        'Description',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  FilledButton(onPressed: () {}, child: Text('Add')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
