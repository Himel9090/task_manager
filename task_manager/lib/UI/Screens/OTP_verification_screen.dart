import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/UI/Screens/reset_password_screen.dart';

import 'package:task_manager/UI/Screens/signUp_sreen.dart';
import 'package:task_manager/UI/weidgets/screen_background.dart';

class OTP_verification_screen extends StatefulWidget {
  const OTP_verification_screen({super.key});
  @override
  State<OTP_verification_screen> createState() =>
      _OTP_verification_screenState();
}

class _OTP_verification_screenState extends State<OTP_verification_screen> {
  final TextEditingController _OtpETcontroler = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  void _ontapnextbutton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Signupscreen()),
    );
  }

  void ontaparrowbutton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => resetpasswordscreen()),
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
                    'Enter Tour OTP',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'A 6 Digit verification pin has been send to your email address',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),

                  SizedBox(height: 24),

                  PinCodeTextField(
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,

                    controller: _OtpETcontroler,
                    appContext: context,
                  ),

                  SizedBox(height: 16),
                  FilledButton(
                    onPressed: () {
                      ontaparrowbutton();
                    },
                    child: Text('verify'),
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
                            text: "Alredy have an acount?",

                            children: [
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(color: Colors.grey),

                                recognizer: TapGestureRecognizer()
                                  ..onTap = _ontapnextbutton,
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
