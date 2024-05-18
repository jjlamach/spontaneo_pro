import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spontaneo_pro/router/router_config.dart';
import 'package:spontaneo_pro/views/onboarding/bloc/interests_cubit.dart';

final GetIt getIt = GetIt.instance;

void main() {
  _injectDependencies();
  runApp(const SpontaneoApp());
}

void _injectDependencies() {
  getIt.registerFactory(() => InterestsCubit());
}

class SpontaneoApp extends StatelessWidget {
  const SpontaneoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<InterestsCubit>()),
      ],
      child: MaterialApp.router(
        title: 'Spontaneo App',
        theme: ThemeData(
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
