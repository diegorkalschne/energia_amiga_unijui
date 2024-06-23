import 'package:flutter/material.dart';

class RotationAnimation extends StatefulWidget {
  const RotationAnimation({
    required this.child,
    this.enabled = true,
    super.key,
  });

  final Widget child;
  final bool enabled;

  @override
  State<RotationAnimation> createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimation> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      reverseDuration: const Duration(seconds: 20),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.ease,
      reverseCurve: Curves.ease,
    );

    if (widget.enabled) {
      _controller!.forward();
    } else {
      _controller!.reset();
    }

    _controller!.addListener(_listener);
  }

  @override
  void dispose() {
    _controller!.removeListener(_listener);

    _controller!.dispose();

    super.dispose();
  }

  void _listener() {
    if (_controller!.value > 0.07) {
      _controller!.reverse();
    } else if (_controller!.value <= 0) {
      _controller!.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation!,
      child: widget.child,
    );
  }
}
