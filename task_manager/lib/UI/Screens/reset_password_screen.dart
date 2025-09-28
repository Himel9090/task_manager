import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/UI/Screens/OTP_verification_screen.dart';
import 'package:task_manager/UI/Screens/login_screen.dart';
import 'package:task_manager/UI/Screens/signUp_sreen.dart';
import 'package:task_manager/UI/weidgets/screen_background.dart';

class resetpasswordscreen extends StatefulWidget {
  const resetpasswordscreen({super.key});
  @override
  State<resetpasswordscreen> createState() => _resetpasswordscreenState();
}

class _resetpasswordscreenState extends State<resetpasswordscreen> {
  final TextEditingController _passwordETcontroler = TextEditingController();
  final TextEditingController _confirmpasswordETcontroler =
      TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordETcontroler.dispose();
    _confirmpasswordETcontroler.dispose();

    super.dispose();
  }

  void _ontapotpscreenbutton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Signupscreen()),
    );
  }

  void ontapConfirmbutton() {
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
                    'Set Password',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Minimum length password 8 charecter with letter and number combination',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),

                  SizedBox(height: 24),

                  TextFormField(
                    controller: _passwordETcontroler,
                    decoration: InputDecoration(hintText: 'New Password'),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _confirmpasswordETcontroler,
                    decoration: InputDecoration(
                      hintText: 'Confirm New Password',
                    ),
                  ),

                  SizedBox(height: 16),
                  FilledButton(
                    onPressed: () {
                      ontapConfirmbutton();
                    },
                    child: Text('Confirm'),
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
