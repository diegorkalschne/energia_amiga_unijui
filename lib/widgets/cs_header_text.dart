import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CsHeaderText extends StatelessWidget {
  const CsHeaderText({
    required this.title,
    this.fontSize = 24,
    this.maxLines,
    super.key,
  });

  final String title;
  final double fontSize;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      label: 'Título: $title',
      child: AutoSizeText(
        title,
        textAlign: TextAlign.center,
        maxLines: maxLines,
        style: TextStyle(
          fontSize: fontSize,
          color: theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
