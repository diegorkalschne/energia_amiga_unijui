import 'package:flutter/material.dart';

import '../../models/ebook_model.dart';
import '../../utils/functions_utils.dart';
import '../../widgets/cs_app_bar.dart';
import '../../widgets/cs_content_text.dart';
import '../../widgets/cs_elevated_button.dart';
import '../../widgets/cs_header_text.dart';

class LivrosDetalhesView extends StatefulWidget {
  const LivrosDetalhesView({
    required this.book,
    super.key,
  });

  final EbookModel book;

  @override
  State<LivrosDetalhesView> createState() => _LivrosDetalhesViewState();
}

class _LivrosDetalhesViewState extends State<LivrosDetalhesView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CsAppBar(title: widget.book.titulo),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(height: 20),
          CsHeaderText(title: widget.book.titulo, maxLines: 2),
          const SizedBox(height: 10),
          SizedBox(
            height: 300,
            width: 200,
            child: Image.network(
              widget.book.urlImagem,
              height: 300,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          if (!isNullOrEmpty(widget.book.descricao)) ...[
            const SizedBox(height: 10),
            CsContentText(text: widget.book.descricao!),
          ],
          Visibility(
            visible: widget.book.capitulos.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: widget.book.capitulos.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  final capitulo = widget.book.capitulos[index];

                  return Text(
                    '- $capitulo',
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.colorScheme.onSurface,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          CsElevatedButton.secondary(
            label: 'Acessar Livro',
            onPressed: () {
              launchUrl(widget.book.urlLivro);
            },
          ),
        ],
      ),
    );
  }
}
