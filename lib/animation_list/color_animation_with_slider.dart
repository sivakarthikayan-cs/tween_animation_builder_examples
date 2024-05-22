import 'package:flutter/material.dart';

class ColorAnimationWithSlider extends StatefulWidget {
  const ColorAnimationWithSlider({Key? key}) : super(key: key);

  @override
  State<ColorAnimationWithSlider> createState() =>
      _ColorAnimationWithSliderState();
}

class _ColorAnimationWithSliderState extends State<ColorAnimationWithSlider> {
  double _newValue = .0;
  Color _newColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder<Color?>(
          tween: ColorTween(begin: Colors.blue, end: _newColor),
          duration: const Duration(milliseconds: 300),
          builder: (_, Color? color, __) {
            return ColorFiltered(
              colorFilter:
                  ColorFilter.mode(color ?? Colors.black, BlendMode.modulate),
              child: const FlutterLogo(
                size: 200,
              ),
            );
          },
        ),
        Slider.adaptive(
          activeColor: _newColor,
          value: _newValue,
          onChanged: (double value) {
            setState(() {
              _newValue = value;
              _newColor =
                  Color.lerp(Colors.blue, Colors.red, value) ?? Colors.black;
            });
          },
        ),
      ],
    );
  }
}
