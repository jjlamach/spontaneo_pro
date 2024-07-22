import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:spontaneo_pro/firebase_options.dart';
import 'package:spontaneo_pro/router/router_config.dart';
import 'package:spontaneo_pro/views/onboarding/bloc/interests_cubit.dart';

final GetIt getIt = GetIt.instance;
final Logger kLogger = Logger(
  printer: PrettyPrinter(
    printEmojis: true,
    colors: true,
  ),
  filter: DevelopmentFilter(),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _injectDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.transparent,
          ),
          outlinedButtonTheme: const OutlinedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white),
              backgroundColor: MaterialStatePropertyAll(
                Color(0xff836FFF),
              ),
              side: MaterialStatePropertyAll(
                BorderSide(
                  color: Colors.transparent,
                ),
              ),
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 12.0,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff836FFF),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff836FFF),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff836FFF),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.redAccent,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.redAccent,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
          ),
          textTheme: const TextTheme(
            displayMedium: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            titleLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xff836FFF),
            onPrimary: Colors.white,
            secondary: Colors.black,
            onSecondary: Colors.white,
            error: Colors.redAccent,
            onError: Colors.white,
            background: Colors.white,
            onBackground: Colors.black,
            surface: Colors.white,
            onSurface: Colors.black,
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
