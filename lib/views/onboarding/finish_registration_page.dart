import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spontaneo_pro/strings.dart';
import 'package:spontaneo_pro/views/onboarding/bloc/interests_cubit.dart';
import 'package:spontaneo_pro/views/onboarding/bloc/onboarding_cubit.dart';

class FinishRegistrationPage extends StatefulWidget {
  const FinishRegistrationPage({super.key});

  @override
  State<FinishRegistrationPage> createState() => _FinishRegistrationPageState();
}

class _FinishRegistrationPageState extends State<FinishRegistrationPage> {
  late TextEditingController _emailCtrl;
  late TextEditingController _passwordCtrl;
  late TextEditingController _username;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailCtrl = TextEditingController();
    _passwordCtrl = TextEditingController();
    _username = TextEditingController();
    _formKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnBoardingCubit, OnBoardingState>(
      listener: (context, state) {
        state.whenOrNull(
          register: (_) => context.go('/home'),
        );
      },
      child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) => state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          initial: () => Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                Strings.finishRegistration,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              const SizedBox(height: 40.0),
                              Text(
                                Strings.email,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 20.0),
                              TextFormField(
                                controller: _emailCtrl,
                                validator: (value) {
                                  final val = value ?? '';
                                  if (val.isEmpty) {
                                    return 'Email is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: Theme.of(context)
                                      .inputDecorationTheme
                                      .border,
                                  focusedBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .focusedBorder,
                                  focusedErrorBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .focusedErrorBorder,
                                  errorBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .errorBorder,
                                  enabledBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .enabledBorder,
                                  disabledBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .disabledBorder,
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Text(
                                Strings.password,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 20.0),
                              TextFormField(
                                controller: _passwordCtrl,
                                validator: (value) {
                                  final val = value ?? '';
                                  if (val.isEmpty) {
                                    return 'Password is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: Theme.of(context)
                                      .inputDecorationTheme
                                      .border,
                                  focusedBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .focusedBorder,
                                  focusedErrorBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .focusedErrorBorder,
                                  errorBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .errorBorder,
                                  enabledBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .enabledBorder,
                                  disabledBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .disabledBorder,
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              Text(
                                Strings.username,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 20.0),
                              TextFormField(
                                controller: _username,
                                validator: (value) {
                                  final val = value ?? '';
                                  if (val.isEmpty) {
                                    return 'Username is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: Theme.of(context)
                                      .inputDecorationTheme
                                      .border,
                                  focusedBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .focusedBorder,
                                  focusedErrorBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .focusedErrorBorder,
                                  errorBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .errorBorder,
                                  enabledBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .enabledBorder,
                                  disabledBorder: Theme.of(context)
                                      .inputDecorationTheme
                                      .disabledBorder,
                                ),
                              ),
                              const SizedBox(
                                height: 100.0,
                              ), // Add some space before the button
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocListener<OnBoardingCubit, OnBoardingState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        register: (_) => context.go('/home'),
                      );
                    },
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FractionallySizedBox(
                        widthFactor: 0.9,
                        child: OutlinedButton(
                          onPressed: () {
                            final isValid = _formKey.currentState?.validate();
                            final state = context.read<InterestsCubit>().state;
                            final Map<String, Set<String>>? interests =
                                state.whenOrNull(
                              submittedInterests: (selectedItems) =>
                                  selectedItems,
                            );
                            if (isValid == true) {
                              context
                                  .read<OnBoardingCubit>()
                                  .registerWithEmailAndPassword(
                                    _emailCtrl.text,
                                    _passwordCtrl.text,
                                    _username.text,
                                    interests,
                                  );
                            }
                          },
                          child: const Text('Register'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
  }
}
