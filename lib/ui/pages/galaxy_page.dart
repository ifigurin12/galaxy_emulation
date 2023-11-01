import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxy_emulation/bloc/planet_bloc.dart';
import 'package:galaxy_emulation/data_layer/database/models/planet.dart';
import 'package:galaxy_emulation/ui/pages/add_planet_page.dart';
import 'package:galaxy_emulation/ui/pages/edit_planets_page.dart';
import 'package:galaxy_emulation/ui/pages/help_classes/galaxy_painter.dart';

class GalaxyPage extends StatefulWidget {
  static const routeName = '/';

  const GalaxyPage({super.key});
  @override
  State<GalaxyPage> createState() => _GalaxyPageState();
}

class _GalaxyPageState extends State<GalaxyPage> {
  double sunRadius = 40.0;
  double scaleFactor = 1.0;

  List<Planet> planets = List.generate(
    10,
    (index) => Planet(
      planetColor: Colors.green,
      planetRemoteness: 0,
      planetSize: Random().nextInt(3),
      planetSpeed: 10,
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final blocState = context.watch<PlanetBloc>().state;
    Offset focalPoint = Offset.zero;

    Timer.periodic(const Duration(milliseconds: 16), (timer) {
      setState(() {});
    });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Galaxy'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlanetPage.routeName);
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditPlanetsPage.routeName);
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: 'plus_scale',
            onPressed: () => setState(
              () {
                scaleFactor *= 1.1;
                focalPoint *= 1.1; // Увеличиваем масштаб на 10%
              },
            ),
            child: const Icon(Icons.add,),
          ),
          const SizedBox(height: 8,),
          FloatingActionButton(
            heroTag: 'minus_scale',
            onPressed: () => setState(
              () {
                scaleFactor /= 1.1;
                focalPoint /= 1.1; // Увеличиваем масштаб на 10%
              },
            ),
            child: const Icon(Icons.remove,),
          ),
        ],
      ),
      body: blocState.when(
        initial: () => const Center(
          child: CircularProgressIndicator(),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: () => const Center(
          child: Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
                'Произошла не предвиденная ошибка, мы уже работаем над ее решением'),
          ),
        ),
        success: () => const Center(
          child: Text('Выполнено успешно'),
        ),
        loaded: (planets) => Center(
          child: CustomPaint(
            painter: GalaxyPainter(
              scaleFactor: scaleFactor,
              sunRadius: sunRadius,
              planets: planets,
              focalPoint: focalPoint,
            ),
          ),
        ),
      ),
    );
  }
}
