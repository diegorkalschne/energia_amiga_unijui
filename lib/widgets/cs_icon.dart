import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CsIcon extends StatelessWidget {
  ///[Icon] personalizado utilizado no aplicativo
  const CsIcon({
    required this.icon,
    this.size = 24,
    this.color,
    super.key,
  });

  final dynamic icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final color = this.color ?? theme.primaryColor;

    if (icon is String) {
      return SvgPicture.asset(
        icon,
        width: size * 1.25,
        height: size * 1.25,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      );
    }

    if (icon is IconData) {
      return Icon(
        icon,
        size: size,
        color: color,
      );
    }

    return const SizedBox();
  }
}
