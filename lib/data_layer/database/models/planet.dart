import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:galaxy_emulation/data_layer/database/models/color_serializer.dart';

part 'planet.freezed.dart';
part 'planet.g.dart';

@freezed
class Planet with _$Planet {
  const factory Planet({
    int? id,
    required int planetSize,
    required int planetRemoteness,
    required double planetSpeed,
    @ColorSerialiser() required Color planetColor,
  }) = _Planet;

  factory Planet.fromJson(Map<String, Object?> json) => _$PlanetFromJson(json);

}
