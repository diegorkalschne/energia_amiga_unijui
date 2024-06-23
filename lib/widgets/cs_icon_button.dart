import 'package:flutter/material.dart';

class CsIconButton extends StatelessWidget {
  const CsIconButton({
    required this.icon,
    this.onPressed,
    this.size = 26,
    this.tooltip,
    this.constraints,
    super.key,
  });

  final Widget icon;
  final void Function()? onPressed;
  final String? tooltip;
  final double? size;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: onPressed,
      splashColor: theme.colorScheme.onPrimary.withOpacity(0.3),
      focusColor: theme.colorScheme.onPrimary.withOpacity(0.3),
      hoverColor: theme.colorScheme.onPrimary.withOpacity(0.3),
      highlightColor: theme.colorScheme.onPrimary.withOpacity(0.3),
      icon: icon,
      alignment: Alignment.center,
      tooltip: tooltip,
      padding: const EdgeInsets.all(0),
      constraints: constraints,
      iconSize: size,
    );
  }
}
