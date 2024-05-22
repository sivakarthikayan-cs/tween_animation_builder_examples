import 'package:flutter/material.dart';
import 'package:tween_animation_builder_example/animation_list/bouncing_animation.dart';
import 'package:tween_animation_builder_example/animation_list/color_animation.dart';
import 'package:tween_animation_builder_example/animation_list/color_animation_with_slider.dart';
import 'package:tween_animation_builder_example/animation_list/opacity_animation.dart';
import 'package:tween_animation_builder_example/animation_list/position_and_scale_animation.dart';
import 'package:tween_animation_builder_example/animation_list/timer_using_tween_animation.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            OpacityAnimation(),
            SizedBox(height: 50),
            PositionAndScaleAnimation(),
            SizedBox(height: 250),
            Timer(),
            SizedBox(height: 50),
            BouncingLogo(),
            SizedBox(height: 50),
            ColorAnimation(),
            SizedBox(height: 50),
            ColorAnimationWithSlider(),
            SizedBox(height: 50),
          ],
        ),
      ),
    ));
  }
}
