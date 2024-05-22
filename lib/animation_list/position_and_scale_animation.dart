import 'package:flutter/material.dart';

class PositionAndScaleAnimation extends StatefulWidget {
  const PositionAndScaleAnimation({Key? key}) : super(key: key);

  @override
  State<PositionAndScaleAnimation> createState() =>
      _PositionAndScaleAnimationState();
}

class _PositionAndScaleAnimationState extends State<PositionAndScaleAnimation> {
  bool _forward = true;
  static const int _durationSecond = 3;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      onEnd: () {
        setState(() {
          _forward = !_forward;
        });
      },
      tween: Tween<Offset>(
          begin: Offset(_forward ? 0 : 100, _forward ? 0 : 100),
          end: Offset(_forward ? 100 : 0, _forward ? 100 : 0)),
      duration: const Duration(seconds: _durationSecond),
      builder: (context, offset, child) {
        return Transform.translate(
          offset: offset,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(
                begin: _forward ? 1.0 : 2.0, end: _forward ? 2.0 : 1.0),
            duration: const Duration(seconds: _durationSecond),
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                        begin: _forward ? 0.0 : 3.0, end: _forward ? 3.0 : 0.0),
                    duration: const Duration(seconds: _durationSecond),
                    builder: (context, scale, child) {
                      return Transform.rotate(
                        angle: scale,
                        child: const FlutterLogo(
                          size: 200,
                        ),
                      );
                    }),
              );
            },
          ),
        );
      },
    );
  }
}
