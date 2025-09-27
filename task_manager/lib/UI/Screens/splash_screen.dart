import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/UI/Screens/login_screen.dart';
import 'package:task_manager/UI/utilitis/assets_path.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    _movetonextscreen();
  }

  Future<void> _movetonextscreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('task manager')),
      body: Stack(
        children: [
          SvgPicture.asset(
            AssetsPath.backgroundsvg,
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Center(child: SvgPicture.asset(AssetsPath.logosvg)),
        ],
      ),
    );
  }
}
