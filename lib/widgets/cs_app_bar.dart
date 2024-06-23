import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CsAppBar({
    required this.title,
    this.centerTitle = true,
    this.actions = const [],
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(65);

  final String title;
  final bool centerTitle;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
      child: Semantics(
        label: 'Título do aplicativo Energia Amiga. Tela atual: $title',
        child: AppBar(
          title: AutoSizeText(
            title,
            maxLines: 1,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          centerTitle: centerTitle,
          actions: actions,
          backgroundColor: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
