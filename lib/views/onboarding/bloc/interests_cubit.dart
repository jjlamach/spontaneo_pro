import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spontaneo_pro/main.dart';

part 'interests_cubit.freezed.dart';

class InterestsCubit extends Cubit<InterestsState> {
  InterestsCubit() : super(const _Initial());

  void toggleSelection(Map<String, Set<String>> interests) {
    emit(_CategoryAdded(interests));
  }

  void untoggelSelection(Map<String, Set<String>> interests) {
    emit(_CategoryUnselected(interests));
  }

  void submitInterests(Map<String, Set<String>> interests) {
    emit(_Interests(interests));
  }

  @override
  void onChange(Change<InterestsState> change) {
    super.onChange(change);
    kLogger.i(
        'InterestCubit: ${change.currentState}\nNextState:${change.nextState}');
  }
}

@freezed
class InterestsState with _$InterestsState {
  const factory InterestsState.initial() = _Initial;
  const factory InterestsState.selectedSubcategory(
      Map<String, Set<String>> selectedItems) = _CategoryAdded;
  const factory InterestsState.unselectedSubCategory(
      Map<String, Set<String>> selectedItems) = _CategoryUnselected;
  const factory InterestsState.submittedInterests(
      Map<String, Set<String>> selectedItems) = _Interests;
  // const factory InterestsState({
  //   required Map<String, Set<String>> selectedItems,
  // }) = _InterestsState;
}
