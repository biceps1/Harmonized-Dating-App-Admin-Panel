import 'dart:async';
import 'package:flutter/material.dart';
import 'package:harmonized_admin/src/core/config/theme/themecolor.dart';
import 'package:harmonized_admin/src/features/auth/login/Reception.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  // NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();

    // notificationServices.requestNotificationPermission();
    // notificationServices.setupInteractMessage(context);
    // notificationServices.firebaseInit(context);

    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Fade-out duration
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the fade-out animation after 1 second
    Future.delayed(const Duration(milliseconds: 300), () {
      _controller.forward();
    });

    // Future.delayed(const Duration(milliseconds: 2300), () async {
    //   Reception().userReception();
    //   // Get.to(()=> LoginScreen());
    // });
    Future.delayed(const Duration(milliseconds: 2300), () {
      try {
        Reception().userReception();
        // Navigate to LoginScreen if needed
        // Get.to(() => LoginScreen());
      } catch (e) {
        print('Error in userReception: $e');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Colors.white.withOpacity(0.0), // Start fully transparent
                    Colors.white.withOpacity(1.0), // End fully opaque
                  ],
                  stops: [1.0 - _animation.value, 0.0],
                ).createShader(rect);
              },
              blendMode: BlendMode.dstIn,
              child: Text("Harmonized",style: TextStyle(fontFamily: "Lilita One",fontSize: MediaQuery.of(context).size.width*0.09,color: Themecolor.primaryColor),),
            );
          },
        ),
      ),
    );
  }
}
