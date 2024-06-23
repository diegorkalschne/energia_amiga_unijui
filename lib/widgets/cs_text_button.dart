import 'package:flutter/material.dart';

class CsTextButton extends StatelessWidget {
  ///Cria um Text Button totalmente customizado para ser utilizado no aplicativo
  const CsTextButton({
    required this.label,
    required this.onPressed,
    this.alignment,
    this.color,
    this.textDecoration,
    super.key,
  })  : secondary = false,
        image = null;

  const CsTextButton.secondary({
    required this.label,
    required this.onPressed,
    required this.image,
    this.alignment,
    this.color,
    this.textDecoration,
    super.key,
  }) : secondary = true;

  final String label;
  final void Function()? onPressed;
  final AlignmentGeometry? alignment;
  final Color? color;
  final TextDecoration? textDecoration;
  final bool secondary;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (secondary) {
      return Align(
        alignment: alignment ?? Alignment.center,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(10),
          splashColor: theme.colorScheme.primary.withOpacity(0.2),
          focusColor: theme.colorScheme.primary.withOpacity(0.2),
          hoverColor: theme.colorScheme.primary.withOpacity(0.2),
          highlightColor: theme.colorScheme.primary.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: textDecoration,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    fontSize: 15,
                    color: color ?? theme.colorScheme.primaryContainer,
                  ),
                ),
                const SizedBox(width: 5),
                Image.asset(image!, height: 18, width: 50),
              ],
            ),
          ),
        ),
      );
    }

    return Align(
      alignment: alignment ?? Alignment.center,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        splashColor: theme.colorScheme.primary.withOpacity(0.2),
        focusColor: theme.colorScheme.primary.withOpacity(0.2),
        hoverColor: theme.colorScheme.primary.withOpacity(0.2),
        highlightColor: theme.colorScheme.primary.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              decoration: textDecoration,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              fontSize: 15,
              color: color ?? theme.colorScheme.primaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}
