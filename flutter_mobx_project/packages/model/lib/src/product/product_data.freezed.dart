// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProductDataTearOff {
  const _$ProductDataTearOff();

  _ProductData call({required int id, required String name}) {
    return _ProductData(
      id: id,
      name: name,
    );
  }
}

/// @nodoc
const $ProductData = _$ProductDataTearOff();

/// @nodoc
mixin _$ProductData {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDataCopyWith<ProductData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDataCopyWith<$Res> {
  factory $ProductDataCopyWith(
          ProductData value, $Res Function(ProductData) then) =
      _$ProductDataCopyWithImpl<$Res>;
  $Res call({int id, String name});
}

/// @nodoc
class _$ProductDataCopyWithImpl<$Res> implements $ProductDataCopyWith<$Res> {
  _$ProductDataCopyWithImpl(this._value, this._then);

  final ProductData _value;
  // ignore: unused_field
  final $Res Function(ProductData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ProductDataCopyWith<$Res>
    implements $ProductDataCopyWith<$Res> {
  factory _$ProductDataCopyWith(
          _ProductData value, $Res Function(_ProductData) then) =
      __$ProductDataCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name});
}

/// @nodoc
class __$ProductDataCopyWithImpl<$Res> extends _$ProductDataCopyWithImpl<$Res>
    implements _$ProductDataCopyWith<$Res> {
  __$ProductDataCopyWithImpl(
      _ProductData _value, $Res Function(_ProductData) _then)
      : super(_value, (v) => _then(v as _ProductData));

  @override
  _ProductData get _value => super._value as _ProductData;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_ProductData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProductData implements _ProductData {
  const _$_ProductData({required this.id, required this.name});

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'ProductData(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductData &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$ProductDataCopyWith<_ProductData> get copyWith =>
      __$ProductDataCopyWithImpl<_ProductData>(this, _$identity);
}

abstract class _ProductData implements ProductData {
  const factory _ProductData({required int id, required String name}) =
      _$_ProductData;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductDataCopyWith<_ProductData> get copyWith =>
      throw _privateConstructorUsedError;
}
