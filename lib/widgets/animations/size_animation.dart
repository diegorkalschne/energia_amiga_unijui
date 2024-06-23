import 'package:flutter/material.dart';

class SizeAnimation extends StatefulWidget {
  const SizeAnimation({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<SizeAnimation> createState() => SizeAnimationState();
}

class SizeAnimationState extends State<SizeAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: widget.child,
    );
  }
}
