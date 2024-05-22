import 'package:flutter/material.dart';

class BouncingLogo extends StatefulWidget {
  const BouncingLogo({Key? key}) : super(key: key);

  @override
  BouncingLogoState createState() => BouncingLogoState();
}

class BouncingLogoState extends State<BouncingLogo> {
  bool _forward = true;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween<Offset>(
          begin: Offset(0, _forward ? -50 : 0),
          end: Offset(0, _forward ? 50 : 0)),
      duration: const Duration(seconds: 1),
      curve: _forward ? Curves.bounceOut : Curves.linear,
      onEnd: () {
        setState(() {
          _forward = !_forward;
        });
      },
      builder: (context, value, child) {
        return Transform.translate(
          offset: value,
          child: const FlutterLogo(size: 200),
        );
      },
    );
  }
}
