import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:galaxy_emulation/data_layer/database/database.dart';
import 'package:galaxy_emulation/data_layer/database/models/planet.dart';

part 'planet_event.dart';
part 'planet_state.dart';
part 'planet_bloc.freezed.dart';

class PlanetBloc extends Bloc<PlanetEvent, PlanetState> {
  final dataBase = DBProvider.db;
  PlanetBloc() : super(const PlanetState.initial()) {
    on<GetPlanets>(
      ((event, emit) async {
        emit(const PlanetState.loading());
        try {
          final planetsJson = await dataBase.getPlanets();
          List<Planet> planets = [];
          for (Map<String, dynamic> json in planetsJson) {
            planets.add(Planet.fromJson(json));
          }
          planets.sort(
            (p1, p2) => p1.planetRemoteness.compareTo(p2.planetRemoteness),
          );
          if (planets.isNotEmpty) {
            emit(PlanetState.loaded(planets: planets));
          } else {
            emit(const PlanetState.error());
          }
        } catch (e) {
          emit(const PlanetState.error());
          dataBase.deleteDatabaseFile();
          log('GetPlanetsEvent: $e');
        }
      }),
    );
    on<AddPlanet>(
      ((event, emit) async {
        emit(const PlanetState.loading());
        try {
          Planet planetsToAdd = event.planet;
          final id = await dataBase.insertPlanet(planetsToAdd.toJson());
          if (id != -1) {
            emit(const PlanetState.success());
          } else {
            emit(const PlanetState.error());
          }
        } catch (e) {
          emit(const PlanetState.error());
          log('AddPlanetEvent: $e');
        }
      }),
    );
    on<DeletePlanet>(
      ((event, emit) async {
        emit(const PlanetState.loading());
        try {
          int id = event.id;
          final countOfDelete = await dataBase.deletePlanet(id);
          if (countOfDelete == 1) {
            emit(const PlanetState.success());
          } else {
            emit(const PlanetState.error());
          }
        } catch (e) {
          emit(const PlanetState.error());
          log('DeletePlanetEvent: $e');
        }
      }),
    );
  }
}
