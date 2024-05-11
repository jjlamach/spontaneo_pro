import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spontaneo_pro/colors.dart';
import 'package:spontaneo_pro/strings.dart';

class SelectYourInterestsPage extends StatelessWidget {
  const SelectYourInterestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: const Text(
          Strings.chooseYourInterests,
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                Strings.chooseCategories,
                style: TextStyle(
                  color: AppColor.wordGrey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                Strings.youCanChangeThem,
                style: TextStyle(
                  color: AppColor.wordGrey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
