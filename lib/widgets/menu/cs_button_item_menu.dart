import 'package:flutter/material.dart';

import '../cs_icon.dart';

class CsButtonItemMenu extends StatelessWidget {
  const CsButtonItemMenu({
    required this.icon,
    required this.title,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      label: 'Botão de menu: $title',
      child: InkWell(
        onTap: onTap,
        splashColor: theme.colorScheme.onPrimary,
        focusColor: theme.colorScheme.onPrimary,
        hoverColor: theme.colorScheme.onPrimary,
        highlightColor: theme.colorScheme.onPrimary,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: theme.primaryColor.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
                child: CsIcon(
                  icon: icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.primaryContainer,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
