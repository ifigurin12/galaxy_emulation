import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:galaxy_emulation/bloc/planet_bloc.dart';
import 'package:galaxy_emulation/data_layer/database/models/planet.dart';
import 'package:galaxy_emulation/ui/pages/galaxy_page.dart';

class AddPlanetPage extends StatefulWidget {
  static const routeName = '/addPlanet';

  const AddPlanetPage({super.key});
  @override
  State<AddPlanetPage> createState() => _AddPlanetPageState();
}

class _AddPlanetPageState extends State<AddPlanetPage> {
  List<String> sizeOptions = ['Маленькая', 'Средняя', 'Большая'];
  int _selectedSize = 0;
  List<String> remotenessOptions = ['Близко', 'Средне', 'Далеко'];
  int _selectedRemoteness = 0;
  Color _selectedColor = Colors.green;

  final TextEditingController _selectedSpeed = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _selectedSpeed.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Добавить планету"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Выберите размер планеты:',
                    style: TextStyle(fontSize: 15),
                  ),
                  Wrap(
                    spacing: 10,
                    children: List<Widget>.generate(
                      sizeOptions.length,
                      (int index) {
                        return ChoiceChip(
                          label: Text(sizeOptions[index]),
                          selected: _selectedSize == index,
                          onSelected: (bool selected) {
                            setState(
                              () {
                                if (selected) {
                                  _selectedSize = index;
                                }
                              },
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    'Выберите удаленность планеты:',
                    style: TextStyle(fontSize: 15),
                  ),
                  Wrap(
                    spacing: 10,
                    children: List<Widget>.generate(
                      remotenessOptions.length,
                      (int index) {
                        return ChoiceChip(
                          label: Text(remotenessOptions[index]),
                          selected: _selectedRemoteness == index,
                          onSelected: (bool selected) {
                            setState(
                              () {
                                if (selected) {
                                  _selectedRemoteness = index;
                                }
                              },
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Выберите цвет'),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Pick a color!'),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      pickerColor: _selectedColor,
                                      onColorChanged: (Color color) {
                                        setState(() {
                                          _selectedColor = color;
                                        });
                                      },
                                    ),
                                  ),
                                  actions: <Widget>[
                                    Center(
                                      child: ElevatedButton(
                                        child: const Text('Choice'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: const Text('Выбрать'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  TextFormField(
                    controller: _selectedSpeed,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                      hintText: 'Введите скорость планеты',
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          double.parse(value) < 0 ||
                          double.parse(value) > 10) {
                        return 'Пожалуйста введите число > 0 и < 10';
                      }
                      return null;
                    },
                  ),
                  BlocListener<PlanetBloc, PlanetState>(
                    listener: (context, state) {
                      state.when(
                        success: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Успешно выполнено!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.of(context).pushNamed(
                              GalaxyPage.routeName);
                        },
                        error: () => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Произошла ошибка!'),
                            backgroundColor: Colors.red,
                          ),
                        ),
                        initial: () {},
                        loading: () {},
                        loaded: (List<Planet> planets) {},
                      );
                    },
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final planet = Planet(
                              planetSize: _selectedSize,
                              planetRemoteness: _selectedRemoteness,
                              planetColor: _selectedColor,
                              planetSpeed:
                                  double.parse(_selectedSpeed.value.text),
                            );
                            BlocProvider.of<PlanetBloc>(context).add(
                              AddPlanet(planet: planet),
                            );
                          }
                        },
                        child: const Text('Добавить планету'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
