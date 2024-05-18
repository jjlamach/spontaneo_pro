import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'interests_cubit.freezed.dart';

// TODO: Logic
class InterestsCubit extends Cubit<InterestsState> {
  InterestsCubit() : super(const InterestsState(selectedItems: {}));

  void toggleSelection(String categoryName, String activities) {}

  @override
  void onChange(Change<InterestsState> change) {
    super.onChange(change);
  }
}

@freezed
class InterestsState with _$InterestsState {
  const factory InterestsState({
    required Map<String, Set<String>> selectedItems,
  }) = _InterestsState;
}
