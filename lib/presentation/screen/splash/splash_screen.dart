import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/roues_manager.dart';
class Splash extends StatefulWidget {
  const Splash({
    super.key,
  });
  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutesManager.home);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: Colors.white,
            child: Image.asset(
              AssetsManager.pattern,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Image.asset(
              AssetsManager.logo,
              height: 208.h,
              width: 199.w,
            ),
            const Spacer(),
            Image.asset(
              AssetsManager.routImage,
              height: 128.h,
              width: 213.w,
            ),
          ],
        ),
      ],
    );
  }
}
