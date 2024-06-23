import 'dart:async';

import 'package:flutter/material.dart';

class SlideTransitionWidget extends StatefulWidget {
  const SlideTransitionWidget({
    required this.child,
    this.duration,
    this.delayDuration,
    this.curve = Curves.linearToEaseOut,
    this.begin = const Offset(-2, 0),
    this.end = const Offset(0, 0),
    super.key,
  });

  final Widget child;
  final Duration? duration;
  final Duration? delayDuration;
  final Curve curve;
  final Offset begin;
  final Offset end;

  @override
  _SlideTransitionState createState() => _SlideTransitionState();
}

class _SlideTransitionState extends State<SlideTransitionWidget> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Timer? timer;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: widget.duration ?? const Duration(milliseconds: 700),
      vsync: this,
    );

    if (widget.delayDuration != null) {
      timer = Timer(widget.delayDuration!, () => controller.forward());
    } else {
      if (mounted) {
        controller.forward(); // Iniciar a animação imediatamente
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: widget.begin,
        end: widget.end,
      ).animate(
        CurvedAnimation(
          curve: widget.curve,
          parent: controller,
        ),
      ),
      child: widget.child,
    );
  }
}
