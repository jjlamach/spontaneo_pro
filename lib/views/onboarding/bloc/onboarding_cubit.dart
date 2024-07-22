import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spontaneo_pro/main.dart';

part 'onboarding_cubit.freezed.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  OnBoardingCubit() : super(const _Initial());

  void registerWithEmailAndPassword(String email, String password) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final accessToken = result.user?.refreshToken ?? '';
    await kPreferences.setString('accessToken', accessToken);
    emit(_Registered(accessToken));
  }

  void logOut() async {
    await _firebaseAuth.signOut();
    await kPreferences.remove('accessToken');
    emit(const _LoggedOut());
  }
}

@freezed
class OnBoardingState with _$OnBoardingState {
  const factory OnBoardingState.initial() = _Initial;
  const factory OnBoardingState.register(String sessionToken) = _Registered;
  const factory OnBoardingState.loading() = _Loading;
  const factory OnBoardingState.logOut() = _LoggedOut;
}
