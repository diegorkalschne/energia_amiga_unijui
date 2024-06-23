import 'dart:async';

import 'package:flutter/material.dart';

class FadeTransitionWidget extends StatefulWidget {
  const FadeTransitionWidget({
    required this.child,
    this.duration,
    this.curve = Curves.elasticOut,
    this.delayDuration,
    super.key,
  });

  final Widget child;
  final Duration? duration;
  final Duration? delayDuration;
  final Curve curve;

  @override
  _FadeTransitionState createState() => _FadeTransitionState();
}

class _FadeTransitionState extends State<FadeTransitionWidget> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: widget.duration ?? const Duration(seconds: 3),
      vsync: this,
    );

    if (widget.delayDuration != null) {
      Future.delayed(widget.delayDuration!, () => controller.forward());
    } else if (mounted) {
      controller.forward(); // Iniciar a animação imediatamente
    }
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: CurvedAnimation(
        curve: widget.curve,
        parent: controller,
      ),
      child: widget.child,
    );
  }
}
