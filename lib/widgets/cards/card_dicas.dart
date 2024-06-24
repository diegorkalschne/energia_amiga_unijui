import 'package:flutter/material.dart';

import '../../models/dicas_model.dart';

class CardDicas extends StatelessWidget {
  const CardDicas({
    required this.dica,
    required this.onTap,
    super.key,
  });

  final DicaModel dica;
  final void Function(DicaModel) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      label: 'Dica ${dica.title}',
      child: Card(
        elevation: 5,
        child: InkWell(
          onTap: () => onTap(dica),
          borderRadius: BorderRadius.circular(12),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.onPrimary.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Semantics(
                    excludeSemantics: true,
                    child: SizedBox(
                      width: 30,
                      height: double.infinity,
                      child: Center(
                        child: Text(
                          dica.title.substring(0, 1).toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    dica.title,
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
