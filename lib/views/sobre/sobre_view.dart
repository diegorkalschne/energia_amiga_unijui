import 'package:flutter/material.dart';

import '../../config/assets/assets_path.dart';
import '../../widgets/cs_app_bar.dart';
import '../../widgets/cs_content_text.dart';
import '../../widgets/cs_header_text.dart';
import '../../widgets/cs_icon.dart';
import '../../widgets/cs_icon_button.dart';
import '../../widgets/cs_text_button.dart';
import '../../widgets/dialogs/cs_alert_dialog_with_content.dart';

class SobreView extends StatefulWidget {
  const SobreView({super.key});

  @override
  State<SobreView> createState() => _SobreViewState();
}

class _SobreViewState extends State<SobreView> {
  void openDialogDesenvolvedores() {
    showDialog(
      context: context,
      builder: (context) {
        return CsAlertWithContent(
          content: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CsHeaderText(title: 'Desenvolvido por'),
                const CsContentText(
                  text: 'Este aplicativo foi desenvolvido durante a disciplina de Design de Interface e IHC, no 7º semestre do curso de Ciência da Computação, da Unijuí, pelos os alunos:\n\n'
                      '- Diego Rafael Kalschne;\n'
                      '- Guilherme Izidro Leal;\n'
                      '- Matheus Rafalski;\n'
                      '- Rafaela Mombach Londero.\n',
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
        title: 'Sobre',
        actions: [
          CsIconButton(
            icon: const CsIcon(icon: Icons.more_vert, color: Colors.white),
            onPressed: openDialogDesenvolvedores,
            tooltip: 'Sobre',
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const CsHeaderText(title: 'Este projeto é uma realização de', maxLines: 1),
          const SizedBox(height: 20),
          const CsContentText(
            text: 'O Projeto Energia Amiga - Unijuí começou em 2017 para ensinar sobre energia elétrica, focando em segurança e eficiência energética. Em 2018, incluiu atividades práticas, concursos e um livro, envolvendo estudantes de Ijuí/RS. Devido ao sucesso, expandiu em 2019 e 2020 para incluir resíduos tecnológicos e alcançar também o comércio e entidades sociais na região noroeste do RS.',
          ),
          const SizedBox(height: 10),
          Image.asset(
            AssetsPath.ENERGIA_AMIGA_LOGO,
            height: 200,
          ),
          const SizedBox(height: 20),
          Image.asset(
            AssetsPath.PROJETO_EXTENSAO_LOGO,
            height: 150,
          ),
          Image.asset(
            AssetsPath.UNIJUI_LOGO,
            height: 100,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
