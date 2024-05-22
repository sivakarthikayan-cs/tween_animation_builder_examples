import 'package:flutter/material.dart';

class ColorAnimation extends StatefulWidget {
  const ColorAnimation({Key? key}) : super(key: key);

  @override
  State<ColorAnimation> createState() => _ColorAnimationState();
}

class _ColorAnimationState extends State<ColorAnimation> {
  Color _currentColor = Colors.blue;
  bool _forward = true;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(
          begin: _currentColor, end: _forward ? Colors.red : Colors.blue),
      duration: const Duration(seconds: 1),
      onEnd: () {
        setState(() {
          _forward = !_forward;
          _currentColor = _forward ? Colors.red : Colors.blue;
        });
      },
      builder: (_, Color? color, __) {
        return ColorFiltered(
          colorFilter: ColorFilter.mode(
            color ?? _currentColor,
            BlendMode.modulate,
          ),
          child: const FlutterLogo(
            size: 200,
          ),
        );
      },
    );
  }
}
