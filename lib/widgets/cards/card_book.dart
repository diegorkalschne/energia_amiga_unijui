import 'package:flutter/material.dart';

import '../../models/ebook_model.dart';
import '../cs_circular_progress_indicador.dart';

class CardBook extends StatelessWidget {
  const CardBook({
    required this.book,
    this.onTap,
    super.key,
  });

  final EbookModel book;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      label: 'Livro ${book.titulo}',
      child: Tooltip(
        message: book.titulo,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.grey[200],
          highlightColor: Colors.grey[200],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const CsCircularProgressIndicador.dark(),
                  Image.network(
                    book.urlImagem,
                    height: 300,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                book.titulo,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
