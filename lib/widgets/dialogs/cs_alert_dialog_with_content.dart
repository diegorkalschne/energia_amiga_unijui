import 'dart:ui';

import 'package:flutter/material.dart';

class CsAlertWithContent extends StatelessWidget {
  ///Widget utilizado para exibir um [AlertDialog] com o seu conteúdo totalmente personalizado
  const CsAlertWithContent({
    required this.content,
    super.key,
  });

  final Widget content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: AlertDialog(
        // Dados obrigatórios
        content: SizedBox(
          width: double.maxFinite,
          child: content,
        ),

        // Default
        elevation: 5,
        backgroundColor: theme.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.all(0),
      ),
    );
  }
}
