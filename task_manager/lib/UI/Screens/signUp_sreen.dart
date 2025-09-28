import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/UI/Screens/login_screen.dart';
import 'package:task_manager/UI/weidgets/screen_background.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});
  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
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

  void _ontaploginbutton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 82),
                  Text(
                    'Join With US',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 24),

                  TextFormField(
                    controller: _emailETcontroler,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _FirstnameETcontroler,
                    decoration: InputDecoration(hintText: 'First Name'),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _lastnameETcontroler,
                    decoration: InputDecoration(hintText: 'Last Name'),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _mobileETcontroler,
                    decoration: InputDecoration(hintText: 'Mobile'),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _passowordETcontroler,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  SizedBox(height: 16),
                  FilledButton(
                    onPressed: () {},
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                  SizedBox(height: 26),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 11),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            text: "Have  acount?",

                            children: [
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(color: Colors.grey),

                                recognizer: TapGestureRecognizer()
                                  ..onTap = _ontaploginbutton,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
