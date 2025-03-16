import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() => runApp(BackgroundEffectsApp());

class BackgroundEffectsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Background Effects',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BackgroundEffect(),
      ),
    );
  }
}

class BackgroundEffect extends StatefulWidget {
  @override
  _BackgroundEffectState createState() => _BackgroundEffectState();
}

class _BackgroundEffectState extends State<BackgroundEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.white,
                Color(0xffc1f7e1),
                Color(0xff7c81ff),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Opacity(
            opacity: 0.3,
            child: Image.asset(
              'assets/img/prism/bg/bg_pattern.png',
              repeat: ImageRepeat.repeat,
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.overlay,
            ),
          ),
        ),
        Positioned.fill(
          child: Image.asset(
            'assets/img/prism/bg/bg_shines_pc.png',
            repeat: ImageRepeat.repeat,
            fit: BoxFit.cover,
          ),
        ),
        ShineItem(
          assetPath: 'assets/img/prism/bg/bg_diamond_pink.png',
          topPercent: 0.1,
          leftPercent: 0.2,
          animationDelay: 0.0,
          animationType: AnimationType.diamond,
          controller: _controller,
        ),
        ShineItem(
          assetPath: 'assets/img/prism/bg/bg_diamond_yellow.png',
          topPercent: 0.15,
          leftPercent: 0.7,
          animationDelay: 0.5,
          animationType: AnimationType.diamond,
          controller: _controller,
        ),
        ShineItem(
          assetPath: 'assets/img/prism/bg/bg_diamond_white.png',
          topPercent: 0.25,
          leftPercent: 0.5,
          animationDelay: 0.3,
          animationType: AnimationType.diamond,
          controller: _controller,
        ),
        ShineItem(
          assetPath: 'assets/img/prism/bg/bg_star_white.png',
          topPercent: 0.35,
          leftPercent: 0.8,
          animationDelay: 0.2,
          animationType: AnimationType.star,
          controller: _controller,
        ),
        ShineItem(
          assetPath: 'assets/img/prism/bg/bg_star_yellow.png',
          topPercent: 0.05,
          leftPercent: 0.3,
          animationDelay: 0.7,
          animationType: AnimationType.star,
          controller: _controller,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double dx = 50 * math.sin(_controller.value * 2 * math.pi);
              return Transform.translate(
                offset: Offset(dx, 0),
                child: Image.asset(
                  'assets/img/prism/bg/bg_aurora_pc.png',
                  fit: BoxFit.cover,
                  height: 200,
                ),
              );
            },
          ),
        ),
        CloudItem(
          assetPath: 'assets/img/prism/bg/bg_cloud_back_l.png',
          top: 50,
          left: 0,
          speed: 20,
          controller: _controller,
        ),
        CloudItem(
          assetPath: 'assets/img/prism/bg/bg_cloud_back_r.png',
          top: 100,
          left: 200,
          speed: 25,
          controller: _controller,
        ),
        CloudItem(
          assetPath: 'assets/img/prism/bg/bg_cloud_back_c.png',
          top: 150,
          left: 100,
          speed: 22,
          controller: _controller,
        ),
        CloudItem(
          assetPath: 'assets/img/prism/bg/bg_cloud_front_l.png',
          top: 200,
          left: 50,
          speed: 30,
          controller: _controller,
        ),
        CloudItem(
          assetPath: 'assets/img/prism/bg/bg_cloud_front_r.png',
          top: 250,
          left: 250,
          speed: 28,
          controller: _controller,
        ),
        CloudItem(
          assetPath: 'assets/img/prism/bg/bg_cloud_front_c.png',
          top: 300,
          left: 150,
          speed: 26,
          controller: _controller,
        ),
        Positioned(
          top: 20,
          left: 20,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double angle = math.pi / 20 * _controller.value;
              return Transform.rotate(
                angle: angle,
                child: Image.asset(
                  'assets/img/prism/bg/bg_moon.png',
                  width: 100,
                  height: 100,
                ),
              );
            },
          ),
        ),
        DotEffect(controller: _controller),
        Positioned(
          bottom: 100,
          left: 0,
          right: 0,
          child: AnimatedRainbowTop(controller: _controller),
        ),
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/img/prism/bg/bg_rainbow_btm_pc.png',
            fit: BoxFit.contain,
            height: 50,
          ),
        ),
      ],
    );
  }
}

enum AnimationType { diamond, star }

class ShineItem extends StatelessWidget {
  final String assetPath;
  final double topPercent;
  final double leftPercent;
  final double animationDelay;
  final AnimationType animationType;
  final AnimationController controller;

  const ShineItem({
    required this.assetPath,
    required this.topPercent,
    required this.leftPercent,
    required this.animationDelay,
    required this.animationType,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final top = size.height * topPercent;
    final left = size.width * leftPercent;
    return Positioned(
      top: top,
      left: left,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double t = (controller.value + animationDelay) % 1.0;
          double scale = 1.0;
          double rotation = 0.0;
          if (animationType == AnimationType.diamond) {
            if (t < 0.8) {
              scale = 1.0;
            } else if (t < 0.9) {
              scale = 1.0 - ((t - 0.8) / 0.1);
            } else {
              scale = (t - 0.9) / 0.1;
            }
          } else if (animationType == AnimationType.star) {
            rotation = t * 2 * math.pi;
          }
          return Transform.scale(
            scale: scale,
            child: Transform.rotate(
              angle: rotation,
              child: Image.asset(
                assetPath,
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }
}

class CloudItem extends StatelessWidget {
  final String assetPath;
  final double top;
  final double left;
  final double speed;
  final AnimationController controller;

  const CloudItem({
    required this.assetPath,
    required this.top,
    required this.left,
    required this.speed,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double offsetX = speed * math.sin(controller.value * 2 * math.pi);
          return Transform.translate(
            offset: Offset(offsetX, 0),
            child: Image.asset(
              assetPath,
              width: 200,
              height: 100,
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}

class DotEffect extends StatelessWidget {
  final AnimationController controller;
  const DotEffect({required this.controller});

  @override
  Widget build(BuildContext context) {
    final dots = [
      {'top': 100.0, 'left': 50.0, 'phase': 0.0},
      {'top': 200.0, 'left': 150.0, 'phase': 0.3},
      {'top': 300.0, 'left': 100.0, 'phase': 0.6},
      {'top': 150.0, 'left': 250.0, 'phase': 0.9},
    ];

    return Stack(
      children: dots.map((dot) {
        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            double phase = dot['phase'] as double;
            double opacity =
                0.5 + 0.5 * math.sin((controller.value + phase) * 2 * math.pi);
            return Positioned(
              top: dot['top'] as double,
              left: dot['left'] as double,
              child: Opacity(
                opacity: opacity.clamp(0.0, 1.0),
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class AnimatedRainbowTop extends StatelessWidget {
  final AnimationController controller;
  const AnimatedRainbowTop({required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double v = controller.value;
        double opacity = (v < 0.5) ? (v * 2) : ((1 - v) * 2);
        return Opacity(
          opacity: opacity.clamp(0.0, 1.0),
          child: Image.asset(
            'assets/img/prism/bg/bg_rainbow_pc.png',
            fit: BoxFit.contain,
            height: 150,
          ),
        );
      },
    );
  }
}
