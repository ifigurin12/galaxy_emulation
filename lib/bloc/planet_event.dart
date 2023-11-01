part of 'planet_bloc.dart';

@freezed
class PlanetEvent with _$PlanetEvent {
  
  const factory PlanetEvent.started() = _Started;
  const factory PlanetEvent.getPlanets() = GetPlanets;
  const factory PlanetEvent.deletePlanet({required int id}) = DeletePlanet;
  const factory PlanetEvent.addPlanet({required Planet planet}) = AddPlanet;


}