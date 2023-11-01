// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Planet _$PlanetFromJson(Map<String, dynamic> json) {
  return _Planet.fromJson(json);
}

/// @nodoc
mixin _$Planet {
  int? get id => throw _privateConstructorUsedError;
  int get planetSize => throw _privateConstructorUsedError;
  int get planetRemoteness => throw _privateConstructorUsedError;
  double get planetSpeed => throw _privateConstructorUsedError;
  @ColorSerialiser()
  Color get planetColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanetCopyWith<Planet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanetCopyWith<$Res> {
  factory $PlanetCopyWith(Planet value, $Res Function(Planet) then) =
      _$PlanetCopyWithImpl<$Res, Planet>;
  @useResult
  $Res call(
      {int? id,
      int planetSize,
      int planetRemoteness,
      double planetSpeed,
      @ColorSerialiser() Color planetColor});
}

/// @nodoc
class _$PlanetCopyWithImpl<$Res, $Val extends Planet>
    implements $PlanetCopyWith<$Res> {
  _$PlanetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? planetSize = null,
    Object? planetRemoteness = null,
    Object? planetSpeed = null,
    Object? planetColor = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      planetSize: null == planetSize
          ? _value.planetSize
          : planetSize // ignore: cast_nullable_to_non_nullable
              as int,
      planetRemoteness: null == planetRemoteness
          ? _value.planetRemoteness
          : planetRemoteness // ignore: cast_nullable_to_non_nullable
              as int,
      planetSpeed: null == planetSpeed
          ? _value.planetSpeed
          : planetSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      planetColor: null == planetColor
          ? _value.planetColor
          : planetColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlanetImplCopyWith<$Res> implements $PlanetCopyWith<$Res> {
  factory _$$PlanetImplCopyWith(
          _$PlanetImpl value, $Res Function(_$PlanetImpl) then) =
      __$$PlanetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int planetSize,
      int planetRemoteness,
      double planetSpeed,
      @ColorSerialiser() Color planetColor});
}

/// @nodoc
class __$$PlanetImplCopyWithImpl<$Res>
    extends _$PlanetCopyWithImpl<$Res, _$PlanetImpl>
    implements _$$PlanetImplCopyWith<$Res> {
  __$$PlanetImplCopyWithImpl(
      _$PlanetImpl _value, $Res Function(_$PlanetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? planetSize = null,
    Object? planetRemoteness = null,
    Object? planetSpeed = null,
    Object? planetColor = null,
  }) {
    return _then(_$PlanetImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      planetSize: null == planetSize
          ? _value.planetSize
          : planetSize // ignore: cast_nullable_to_non_nullable
              as int,
      planetRemoteness: null == planetRemoteness
          ? _value.planetRemoteness
          : planetRemoteness // ignore: cast_nullable_to_non_nullable
              as int,
      planetSpeed: null == planetSpeed
          ? _value.planetSpeed
          : planetSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      planetColor: null == planetColor
          ? _value.planetColor
          : planetColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanetImpl with DiagnosticableTreeMixin implements _Planet {
  const _$PlanetImpl(
      {this.id,
      required this.planetSize,
      required this.planetRemoteness,
      required this.planetSpeed,
      @ColorSerialiser() required this.planetColor});

  factory _$PlanetImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanetImplFromJson(json);

  @override
  final int? id;
  @override
  final int planetSize;
  @override
  final int planetRemoteness;
  @override
  final double planetSpeed;
  @override
  @ColorSerialiser()
  final Color planetColor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Planet(id: $id, planetSize: $planetSize, planetRemoteness: $planetRemoteness, planetSpeed: $planetSpeed, planetColor: $planetColor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Planet'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('planetSize', planetSize))
      ..add(DiagnosticsProperty('planetRemoteness', planetRemoteness))
      ..add(DiagnosticsProperty('planetSpeed', planetSpeed))
      ..add(DiagnosticsProperty('planetColor', planetColor));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.planetSize, planetSize) ||
                other.planetSize == planetSize) &&
            (identical(other.planetRemoteness, planetRemoteness) ||
                other.planetRemoteness == planetRemoteness) &&
            (identical(other.planetSpeed, planetSpeed) ||
                other.planetSpeed == planetSpeed) &&
            (identical(other.planetColor, planetColor) ||
                other.planetColor == planetColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, planetSize, planetRemoteness, planetSpeed, planetColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanetImplCopyWith<_$PlanetImpl> get copyWith =>
      __$$PlanetImplCopyWithImpl<_$PlanetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanetImplToJson(
      this,
    );
  }
}

abstract class _Planet implements Planet {
  const factory _Planet(
      {final int? id,
      required final int planetSize,
      required final int planetRemoteness,
      required final double planetSpeed,
      @ColorSerialiser() required final Color planetColor}) = _$PlanetImpl;

  factory _Planet.fromJson(Map<String, dynamic> json) = _$PlanetImpl.fromJson;

  @override
  int? get id;
  @override
  int get planetSize;
  @override
  int get planetRemoteness;
  @override
  double get planetSpeed;
  @override
  @ColorSerialiser()
  Color get planetColor;
  @override
  @JsonKey(ignore: true)
  _$$PlanetImplCopyWith<_$PlanetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
