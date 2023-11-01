import 'dart:math';

import 'package:flutter/material.dart';
import 'package:galaxy_emulation/data_layer/database/models/planet.dart';

class GalaxyPainter extends CustomPainter {
  final double sunRadius;
  final List<Planet> planets;
  final double scaleFactor;
  final Offset focalPoint;
  final planetSizes = [3.0, 6.0, 9.0];

  GalaxyPainter(
      {required this.scaleFactor,
      required this.sunRadius,
      required this.planets,
      required this.focalPoint});

  @override
  void paint(Canvas canvas, Size size) {
    // final center = size.center(Offset.zero);
    // canvas.scale(scaleFactor);

    // Рассчитываем смещение для центрирования солнца и планет
    final centerOffset = Rect.fromCenter(
          center: const Offset(0, 0),
          width: size.width,
          height: size.height,
        ).center -
        focalPoint;

    // Применяем масштабирование и смещение
    canvas.scale(scaleFactor);
    canvas.translate(centerOffset.dx, centerOffset.dy);

    Paint sunPaint = Paint()
      ..color = Colors.yellowAccent
      ..style = PaintingStyle.fill;

    final angle = DateTime.now().millisecondsSinceEpoch *
        0.0001; // Изменение угла со временем

    // Рисуем внешнюю окружность
    canvas.drawCircle(centerOffset, sunRadius, sunPaint);

    // Рисуем окружности, вращающиеся вокруг внешней окружности (планеты)
    for (int i = 0; i < planets.length; i++) {
      final orbitRadius = calculateOrbitRadius(i);
      final planetAngle = angle * planets[i].planetSpeed;
      final x = centerOffset.dx + orbitRadius * cos(planetAngle);
      final y = centerOffset.dy + orbitRadius * sin(planetAngle);
      canvas.drawCircle(
        Offset(x, y),
        planetSizes[planets[i].planetSize],
        Paint()
          ..color = planets[i].planetColor
          ..style = PaintingStyle.fill,
      );
    }
  }

  double calculateOrbitRadius(int index) {
    const planetSpacing = 40.0; 
    return index == 0 ? planetSpacing * 2 : (index + 2) * planetSpacing ;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
