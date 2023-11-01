import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  static const routeName = '/notFoundPage';
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Страница не найдена'),
      ),
      body: const Center(
        child: Text('Запрашиваемой страницы не существует'),
      ),
    );
  }
}
