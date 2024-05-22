import 'package:flutter/material.dart';

class OpacityAnimation extends StatefulWidget {
  const OpacityAnimation({super.key});

  @override
  State<OpacityAnimation> createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation> {
  late bool _forward = false;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      onEnd: () {
        setState(() {
          _forward = !_forward;
        });
      },
      tween:
          Tween<double>(begin: _forward ? 0.0 : 1.0, end: _forward ? 1.0 : 0.0),
      duration: const Duration(seconds: 2),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: const FlutterLogo(
            size: 200,
          ),
        );
      },
    );
  }
}
