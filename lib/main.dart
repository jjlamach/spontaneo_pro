import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spontaneo_pro/router/router_config.dart';
import 'package:spontaneo_pro/views/onboarding/bloc/interests_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _injectDependencies();
  await Supabase.initialize(
    url: 'https://nwhswqnhabkvxfxjrwdl.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im53aHN3cW5oYWJrdnhmeGpyd2RsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTYxNTU0MTksImV4cCI6MjAzMTczMTQxOX0.ryOIC8U07oNd9nJAy4um8uhnQonGt_ugMxdKjPP0-mM',
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
        ),
        routerConfig: router,
      ),
    );
  }
}
