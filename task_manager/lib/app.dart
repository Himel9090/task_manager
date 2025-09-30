import 'package:flutter/material.dart';
import 'package:task_manager/UI/Screens/Update_profile_screen.dart';
import 'package:task_manager/UI/Screens/login_screen.dart';
import 'package:task_manager/UI/Screens/main_navbar_holder_screen.dart';
import 'package:task_manager/UI/Screens/signUp_sreen.dart';
import 'package:task_manager/UI/Screens/splash_screen.dart';

class taskmanagerapp extends StatelessWidget {
  const taskmanagerapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //text  them
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),

        //form  defult style
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        //field button style
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: Colors.green,
            fixedSize: Size.fromWidth(double.maxFinite),
            padding: EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => Splashscreen(),
        '/login': (_) => LoginScreen(),
        '/sign_up': (_) => Signupscreen(),
        '/dashboard': (_) => MainNavbarHolderScreen(),
        '/Update_profile': (_) => UpdateProfileScreen(),

        // '/':(_)=>Splashscreen(),
        // '/':(_)=>Splashscreen(),
        // '/':(_)=>Splashscreen(),
        // '/':(_)=>Splashscreen(),
      },
    );
  }
}
