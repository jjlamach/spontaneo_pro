// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interests_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InterestsState {
  Map<String, Set<String>> get selectedItems =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InterestsStateCopyWith<InterestsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterestsStateCopyWith<$Res> {
  factory $InterestsStateCopyWith(
          InterestsState value, $Res Function(InterestsState) then) =
      _$InterestsStateCopyWithImpl<$Res, InterestsState>;
  @useResult
  $Res call({Map<String, Set<String>> selectedItems});
}

/// @nodoc
class _$InterestsStateCopyWithImpl<$Res, $Val extends InterestsState>
    implements $InterestsStateCopyWith<$Res> {
  _$InterestsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItems = null,
  }) {
    return _then(_value.copyWith(
      selectedItems: null == selectedItems
          ? _value.selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as Map<String, Set<String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InterestsStateImplCopyWith<$Res>
    implements $InterestsStateCopyWith<$Res> {
  factory _$$InterestsStateImplCopyWith(_$InterestsStateImpl value,
          $Res Function(_$InterestsStateImpl) then) =
      __$$InterestsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, Set<String>> selectedItems});
}

/// @nodoc
class __$$InterestsStateImplCopyWithImpl<$Res>
    extends _$InterestsStateCopyWithImpl<$Res, _$InterestsStateImpl>
    implements _$$InterestsStateImplCopyWith<$Res> {
  __$$InterestsStateImplCopyWithImpl(
      _$InterestsStateImpl _value, $Res Function(_$InterestsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItems = null,
  }) {
    return _then(_$InterestsStateImpl(
      selectedItems: null == selectedItems
          ? _value._selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as Map<String, Set<String>>,
    ));
  }
}

/// @nodoc

class _$InterestsStateImpl implements _InterestsState {
  const _$InterestsStateImpl(
      {required final Map<String, Set<String>> selectedItems})
      : _selectedItems = selectedItems;

  final Map<String, Set<String>> _selectedItems;
  @override
  Map<String, Set<String>> get selectedItems {
    if (_selectedItems is EqualUnmodifiableMapView) return _selectedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedItems);
  }

  @override
  String toString() {
    return 'InterestsState(selectedItems: $selectedItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterestsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedItems, _selectedItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_selectedItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InterestsStateImplCopyWith<_$InterestsStateImpl> get copyWith =>
      __$$InterestsStateImplCopyWithImpl<_$InterestsStateImpl>(
          this, _$identity);
}

abstract class _InterestsState implements InterestsState {
  const factory _InterestsState(
          {required final Map<String, Set<String>> selectedItems}) =
      _$InterestsStateImpl;

  @override
  Map<String, Set<String>> get selectedItems;
  @override
  @JsonKey(ignore: true)
  _$$InterestsStateImplCopyWith<_$InterestsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
