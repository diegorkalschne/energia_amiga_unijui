import 'package:flutter/material.dart';

import '../../widgets/cs_app_bar.dart';
import '../../widgets/cs_content_text.dart';
import '../../widgets/cs_header_text.dart';
import '../../widgets/cs_icon.dart';
import '../../widgets/cs_icon_button.dart';
import '../../widgets/cs_text_button.dart';
import '../../widgets/cs_youtube_player.dart';
import '../../widgets/dialogs/cs_alert_dialog_with_content.dart';

class SobreProjetoView extends StatefulWidget {
  const SobreProjetoView({super.key});

  @override
  State<SobreProjetoView> createState() => _SobreProjetoViewState();
}

class _SobreProjetoViewState extends State<SobreProjetoView> {
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
                  text: 'Nesta seção do aplicativo, você conhece um pouco mais da história do projeto da Energia Amiga.',
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
      appBar: CsAppBar(
        title: 'Sobre o Projeto',
        actions: [
          CsIconButton(
            icon: const CsIcon(icon: Icons.help_outline_rounded, color: Colors.white),
            tooltip: 'Ajuda',
            onPressed: openDialogHelp,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          SizedBox(height: 20),
          CsHeaderText(title: 'Nossa História'),
          SizedBox(height: 10),
          CsContentText(
            text: 'Visando extrapolar a atuação da extensão universitária, no ano de 2017 teve seu início o Projeto Energia Amiga - Unijuí, que tem na sua essência o objetivo de levar às crianças e jovens do ensino fundamental os conhecimentos sobre energia elétrica.\n\n'
                'Em 2017, o projeto foi elaborado baseado em dois pilares: segurança em eletricidade e eficiência energética. Já em 2018, foram colocadas em prática as ações e estudantes de escolas de Ijuí/RS participaram de diálogos, atividades práticas, concurso de redação e desenho e foram apresentados com a primeira edição do Livro Descobrindo a Eletricidade.\n\n'
                'Ao final de 2018, percebeu-se que o projeto havia cativado a atenção de todos os participantes, e diante deste resultado, a continuação do projeto foi naturalmente planejada. Com a vivência e resultados das ações de 2018, o projeto Energia Amiga recebeu uma nova linha de estudo,  um novo público alvo a ampliou a região de atuação.\n\n'
                'As ações planejadas para 2019 e 2020, incluem a abordagem dos temas: segurança em eletricidade, eficiência energética e resíduos tecnológicos, tendo como público alvo. As atividades Projeto Energia Amiga tem como público alvo estudantes do ensino fundamental e o comércio e entidades sociais e individuais que zelam pela correta aplicação da logística reversa. O projeto abrange a região noroeste do estado do Rio Grande do Sul, local de atuação da Unijuí.\n\n'
                'Em 2021 e 2022 o Projeto Energia Amiga tem como objetivo ampliar a sua atuação. As ações serão realizadas em cidades do noroeste do RS, em Balsas (MA), Portugal e Espanha.',
          ),
          SizedBox(height: 10),
          CsYoutubePlayer(
            link: 'https://www.youtube.com/watch?v=wxI6WtWhX-0',
          )
        ],
      ),
    );
  }
}
