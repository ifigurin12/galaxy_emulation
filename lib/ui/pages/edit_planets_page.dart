import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galaxy_emulation/bloc/planet_bloc.dart';
import 'package:galaxy_emulation/ui/pages/galaxy_page.dart';

class EditPlanetsPage extends StatelessWidget {
  static const routeName = '/editPlanets';

  const EditPlanetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final blocState = context.watch<PlanetBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planets Edit'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                GalaxyPage.routeName, (route) => false);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: blocState.when(
          initial: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: () => const Center(
            child: Text(
                'Произошла не предвиденная ошибка, мы уже работаем над ее решением'),
          ),
          success: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (planets) => Center(
            child: ListView.builder(
              itemCount: planets.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('ID: ${planets[index].id}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      context.read<PlanetBloc>().add(
                            DeletePlanet(id: planets[index].id!),
                          );
                      context.read<PlanetBloc>().add(
                            const GetPlanets(),
                          );
                    },
                  ),
                  leading: Container(
                    width: 24,
                    height: 24,
                    color: planets[index].planetColor,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
