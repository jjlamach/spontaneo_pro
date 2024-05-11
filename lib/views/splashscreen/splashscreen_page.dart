import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spontaneo_pro/colors.dart';
import 'package:spontaneo_pro/strings.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({super.key});

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  bool _startedValue = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
    ).then((_) {
      setState(() {
        _startedValue = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _startedValue == true ? Colors.white : Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_startedValue == true)
              const Expanded(child: SizedBox())
            else
              const SizedBox.shrink(),
            const Text(
              Strings.appTitle,
              style: TextStyle(
                color: Color(0xff836FFF),
                fontWeight: FontWeight.w700,
                fontSize: 50.0,
              ),
            ),
            Text(
              Strings.appMotto,
              style: TextStyle(
                color: _startedValue == true ? Colors.black : Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 20.0,
              ),
            ),
            if (_startedValue == true) ...[
              const Expanded(child: SizedBox()),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    Strings.logIn,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColor.purple,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    side: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  child: Text(
                    Strings.register,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
            ]
          ],
        ),
      ),
    );
  }
}
