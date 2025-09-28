import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/UI/Screens/OTP_verification_screen.dart';
import 'package:task_manager/UI/Screens/signUp_sreen.dart';
import 'package:task_manager/UI/weidgets/screen_background.dart';

class ForgetPassowrdVerifyEmailScreen extends StatefulWidget {
  const ForgetPassowrdVerifyEmailScreen({super.key});
  @override
  State<ForgetPassowrdVerifyEmailScreen> createState() =>
      _ForgetPassowrdVerifyEmailScreenState();
}

class _ForgetPassowrdVerifyEmailScreenState
    extends State<ForgetPassowrdVerifyEmailScreen> {
  final TextEditingController _emailETcontroler = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailETcontroler.dispose();

    super.dispose();
  }

  void _ontapotpscreenbutton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Signupscreen()),
    );
  }

  void ontapotpscreenbutton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OTP_verification_screen()),
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
                    'Your Email Addres',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'A 6 Digit verification pin will send to your email address',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),

                  SizedBox(height: 24),

                  TextFormField(
                    controller: _emailETcontroler,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),

                  SizedBox(height: 16),
                  FilledButton(
                    onPressed: () {
                      ontapotpscreenbutton();
                    },
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                  SizedBox(height: 26),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            text: "Have an acount?",

                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(color: Colors.grey),

                                recognizer: TapGestureRecognizer()
                                  ..onTap = _ontapotpscreenbutton,
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
