import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spontaneo_pro/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'onboarding_cubit.freezed.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  OnBoardingCubit() : super(const _Initial());

  void registerWithEmailAndPassword(
    String email,
    String password,
    String newUsername,
    Map<String, Set<String>>? interests,
  ) async {
    emit(const _Loading());
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    User? user = result.user;
    await user?.updateDisplayName(newUsername);
    // Do I need this?
    await user?.reload();

    final accessToken = result.user?.refreshToken ?? '';
    final username = FirebaseAuth.instance.currentUser?.displayName ?? email;
    await kPreferences.setString('accessToken', accessToken);
    await kPreferences.setString('username', username);

    final modifiableInterests = Map<String, Set<String>>.from(interests ?? {});
    modifiableInterests.removeWhere((key, value) => value.isEmpty);

    // Save to DB
    await _firestore.collection('users').doc(username).set(
      {
        'interests': modifiableInterests,
      },
    );
    emit(_Registered(accessToken));
  }

  void logIn(String email, String password) async {
    emit(const _Loading());
    final UserCredential credential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final accessToken = credential.user?.refreshToken ?? '';
    await kPreferences.setString('accessToken', accessToken);
    await kPreferences.setString(
      'username',
      credential.user?.displayName ?? email,
    );
    emit(const _LoggedIn());
  }

  void logOut() async {
    emit(const _Loading());
    await _firebaseAuth.signOut();
    await kPreferences.remove('accessToken');
    await kPreferences.remove('username');
    emit(const _LoggedOut());
  }

  @override
  void onChange(Change<OnBoardingState> change) {
    super.onChange(change);
    kLogger.i('OnBoardingCubit: $change');
  }
}

@freezed
class OnBoardingState with _$OnBoardingState {
  const factory OnBoardingState.initial() = _Initial;
  const factory OnBoardingState.register(String sessionToken) = _Registered;
  const factory OnBoardingState.loading() = _Loading;
  const factory OnBoardingState.logIn() = _LoggedIn;
  const factory OnBoardingState.logOut() = _LoggedOut;
}
