import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxy_emulation/bloc/planet_bloc.dart';
import 'package:galaxy_emulation/ui/pages/add_planet_page.dart';
import 'package:galaxy_emulation/ui/pages/edit_planets_page.dart';

import 'package:galaxy_emulation/ui/pages/galaxy_page.dart';
import 'package:galaxy_emulation/ui/pages/not_found_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Colors.purple,
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        initialRoute: GalaxyPage.routeName,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case GalaxyPage.routeName:
              return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    BlocProvider<PlanetBloc>(
                  create: (context) => PlanetBloc()..add(const GetPlanets()),
                  child: const GalaxyPage(),
                ),
              );
            case EditPlanetsPage.routeName:
              return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    BlocProvider<PlanetBloc>(
                  create: (context) => PlanetBloc() ..add(const GetPlanets()),
                  child: const EditPlanetsPage(),
                ),
              );
            case AddPlanetPage.routeName:
              return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    BlocProvider<PlanetBloc>(
                  create: (context) => PlanetBloc(),
                  child: const AddPlanetPage(),
                ),
              );
            default:
              return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const NotFoundPage(),
              );
          }
        });
  }
}
