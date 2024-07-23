import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spontaneo_pro/main.dart';
import 'package:spontaneo_pro/views/onboarding/bloc/onboarding_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<OnBoardingCubit, OnBoardingState>(
          listener: (context, state) {
            state.whenOrNull(
              logOut: () => context.go('/'),
            );
          },
          child: TextButton(
            onPressed: () => context.read<OnBoardingCubit>().logOut(),
            child: Text('Log Out, ${kPreferences.getString('username')}'),
          ),
        ),
      ),
    );
  }
}
