part of 'planet_bloc.dart';

@freezed
class PlanetState with _$PlanetState {
  const factory PlanetState.initial() = _Initial;
  const factory PlanetState.loading() = _Loading;
  const factory PlanetState.error() = _Error;
  const factory PlanetState.success() = _Success;
  const factory PlanetState.loaded({required List<Planet> planets}) = _Loaded;
}
