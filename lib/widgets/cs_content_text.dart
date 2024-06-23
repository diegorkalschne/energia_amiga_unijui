import 'package:flutter/material.dart';

class CsContentText extends StatelessWidget {
  const CsContentText({
    required this.text,
    this.textAlign = TextAlign.justify,
    super.key,
  });

  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 16,
        color: theme.colorScheme.onSurface,
      ),
    );
  }
}
