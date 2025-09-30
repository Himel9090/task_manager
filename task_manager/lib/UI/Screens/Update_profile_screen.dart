import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager/UI/weidgets/Photo_picker.dart';
import 'package:task_manager/UI/weidgets/TM%20AppBar.dart';
import 'package:task_manager/UI/weidgets/screen_background.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});
  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _emailETcontroler = TextEditingController();
  final TextEditingController _passowordETcontroler = TextEditingController();
  final TextEditingController _FirstnameETcontroler = TextEditingController();
  final TextEditingController _lastnameETcontroler = TextEditingController();
  final TextEditingController _mobileETcontroler = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailETcontroler.dispose();
    _passowordETcontroler.dispose();
    _FirstnameETcontroler.dispose();
    _lastnameETcontroler.dispose();
    _mobileETcontroler.dispose();
    super.dispose();
  }

  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedImage;
  Future<void> _pickimage() async {
    XFile? pickedimage = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedimage != null) {
      _selectedImage = pickedimage;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(fromupdateProfile: true),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 82),
                  Text(
                    'Update profile',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  photopicker(
                    onTap: () {
                      _pickimage();
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailETcontroler,
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _FirstnameETcontroler,
                    decoration: const InputDecoration(hintText: 'First Name'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _lastnameETcontroler,
                    decoration: const InputDecoration(hintText: 'Last Name'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _mobileETcontroler,
                    decoration: const InputDecoration(hintText: 'Mobile'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passowordETcontroler,
                    decoration: const InputDecoration(hintText: 'Password'),
                  ),
                  const SizedBox(height: 16),
                  FilledButton(onPressed: () {}, child: const Text('Update')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
