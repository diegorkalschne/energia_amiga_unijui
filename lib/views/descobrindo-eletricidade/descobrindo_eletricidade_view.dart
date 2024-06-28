import 'package:flutter/material.dart';

import '../../config/routes/local_routes.dart';
import '../../models/ebook_model.dart';
import '../../stores/livros_store.dart';
import '../../widgets/cards/card_book.dart';
import '../../widgets/cs_app_bar.dart';
import '../../widgets/cs_content_text.dart';
import '../../widgets/cs_header_text.dart';
import '../../widgets/cs_icon.dart';
import '../../widgets/cs_icon_button.dart';
import '../../widgets/cs_text_button.dart';
import '../../widgets/dialogs/cs_alert_dialog_with_content.dart';

class DescobrindoEletricidadeView extends StatefulWidget {
  const DescobrindoEletricidadeView({super.key});

  @override
  State<DescobrindoEletricidadeView> createState() => _DescobrindoEletricidadeViewState();
}

class _DescobrindoEletricidadeViewState extends State<DescobrindoEletricidadeView> {
  final List<EbookModel> livros = LivrosStore.livros;

  void onSelect(EbookModel book) {
    Navigator.of(context).pushNamed(LocalRoutes.LIVROS_DETALHES, arguments: book);
  }

  void openDialogHelp() {
    showDialog(
      context: context,
      builder: (context) {
        return CsAlertWithContent(
          content: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CsHeaderText(title: 'Ajuda'),
                const CsContentText(
                  text: 'Nesta seção do aplicativo, você encontra livros que abordam o assunto da eletricidade, contendo dicas e curiosidades sobre a mesma.',
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                CsTextButton(
                  label: 'Fechar',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CsAppBar(title: 'Descobrindo a Eletricidade', actions: [
        CsIconButton(
          icon: const CsIcon(icon: Icons.help_outline_rounded, color: Colors.white),
          tooltip: 'Ajuda',
          onPressed: openDialogHelp,
        ),
      ]),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(height: 20),
          const CsHeaderText(title: 'Coleção de Livros'),
          const SizedBox(height: 10),
          const CsContentText(
            text: 'A Coleção de livros Descobrindo a Eletricidade é um dos objetivos que nasceu junto com o Projeto Energia Amiga.  O estudo sobre Energia Elétrica muitas vezes é considerado difícil e inacessível. Para quebrar essas barreiras, foram elaborados dois livros que compõe a coleção. O Volume I é para crianças de 8 a 10 anos e o Volume II é para jovens de 13 a 15 anos.  A primeira edição, lançada em 2018, contou com a impressão de 1100 unidades. A segunda edição foi publicada em 2019, onde 8000 unidades foram impressas.  Em 2020 os livros ganharam uma versão on-line.\n\n'
                'Além da Coleção Descobrindo Eletricidade, o Projeto Energia Amiga, em parceria com o Projeto Meninas Que Engenham o Futuro, lançaram em 2020, o livro Água Energia Elétrica: Teoria e Prática sobre o Uso Eficiente.\n\n'
                'Outro publicação, de periodicidade anual, são os livros que apresenta os trabalhos desenvolvidos pelos estudantes do ensino básico, participantes do projeto. A cada ano os estudantes são desafiados a desenvolverem atividades, e a partir de estudos, confeccionam redações, desenhos e texto,  com a temática relacionada ao projeto Energia Amiga.\n\n'
                'Todos os livros podem ser acessados de forma gratuita no site da Editora UNIJUÍ.  Clique nos links e navegue nesse mundo de conhecimento e criatividade.',
          ),
          const SizedBox(height: 10),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: livros.length,
            itemBuilder: (_, index) {
              final book = livros[index];

              return CardBook(
                book: book,
                onTap: () => onSelect(book),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 10),
          )
        ],
      ),
    );
  }
}
