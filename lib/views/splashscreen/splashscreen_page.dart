import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({super.key});

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
    ).then(
      (value) => context.replace('/'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SPONTANEO',
              style: TextStyle(
                color: const Color(0xff836FFF),
                fontWeight: FontWeight.w700,
                fontSize: 50.0,
              ),
            ),
            Text(
              'Discover the Joy\nof Not Knowing',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
