import 'package:flutter/material.dart';
import 'package:quitsmoke/comps/particleSpawner.dart';

class ParticlePainter extends CustomPainter {
  final int particleCount;
  int particleRadius = 3;
  int sprayRadius = 100;

  ParticleSpawner particles;
  // Rect _area;
  late Paint mPaint;
  late Paint bgPaint;

  ParticlePainter({required this.particleCount, required this.particles}) : super(repaint: particles) {
    mPaint = new Paint();
    bgPaint = new Paint()..color = Color.fromARGB(120, 145, 132, 245);
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (final particle in particles.particles) {
      _drawParticle(particle, canvas);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  _drawParticle(Particle particle, Canvas canvas) {
    // final random = Random();
    canvas.drawOval(Rect.fromLTWH(particle.x, particle.y, particle.r, particle.r), Paint()..color = particle.color ?? Colors.white);
  }
}

class Particle {
  late double vX;
  late double vY;

  late double x;
  late double y;
  double r = 3;
  final Color? color;

  Particle({
    required double xval,
    required double yval,
    double? avalX,
    double? avalY,
    required double vvalX,
    required double vvalY,
    this.color,
  }) {
    x = xval;
    y = yval;
    vX = vvalX;
    vY = vvalY;
  }

  update() {
    x += vX;
    y += vY;

    vX *= 0.99;
    vY *= 0.99;
  }
}
