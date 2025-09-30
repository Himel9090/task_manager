import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/UI/Screens/login_screen.dart';
import 'package:task_manager/UI/weidgets/SnackbarMassage.dart';
import 'package:task_manager/UI/weidgets/screen_background.dart';
import 'package:task_manager/data/services/Apicaller.dart';
import 'package:task_manager/data/utils/urls.dart';

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
  bool _signupinprogress = false;
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

  void ontapregisterbutton() {
    if (_formkey.currentState!.validate()) {
      _signup();
    }
  }

  void _cleartextField() {
    _FirstnameETcontroler.clear();
    _emailETcontroler.clear();
    _lastnameETcontroler.clear();
    _mobileETcontroler.clear();
    _passowordETcontroler.clear();
  }

  Future<void> _signup() async {
    _signupinprogress = true;
    setState(() {});
    Map<String, dynamic> requestbody = {
      "email": _emailETcontroler.text.trim(),
      "firstName": _FirstnameETcontroler.text.trim(),
      "lastName": _lastnameETcontroler.text.trim(),
      "mobile": _mobileETcontroler.text.trim(),
      "password": _passowordETcontroler.text,
    };
    final ApiResponse response = await Apicaller.postRequest(
      url: Urls.registrationurl,
      body: requestbody,
    );
    _signupinprogress = false;
    setState(() {});

    if (response.isSucess) {
      _cleartextField();
      showSnackBarMessage(
        context,
        'Registration Sucessfull plewase login!!!!!!',
      );
    } else {
      showSnackBarMessage(context, response.errormassage!);
    }
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    textInputAction: TextInputAction.next,
                    controller: _emailETcontroler,
                    decoration: InputDecoration(hintText: 'Email'),

                    validator: (String? value) {
                      String inputText = value ?? '';
                      if (EmailValidator.validate(inputText) == false) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _FirstnameETcontroler,
                    decoration: InputDecoration(hintText: 'First Name'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter First Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _lastnameETcontroler,
                    decoration: InputDecoration(hintText: 'Last Name'),

                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter Last Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _mobileETcontroler,
                    decoration: InputDecoration(hintText: 'Mobile'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your mobile';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _passowordETcontroler,
                    decoration: InputDecoration(hintText: 'Password'),
                    validator: (String? value) {
                      if ((value?.length ?? 0) <= 6) {
                        return 'Enter  pasword at lest 6 charecter';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Visibility(
                    visible: _signupinprogress == false,
                    replacement: Center(child: CircularProgressIndicator()),
                    child: FilledButton(
                      onPressed: ontapregisterbutton,
                      child: Icon(Icons.arrow_circle_right_outlined),
                    ),
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
