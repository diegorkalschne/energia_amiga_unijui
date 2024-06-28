import 'package:flutter/material.dart';

import '../../../config/assets/assets_path.dart';
import '../../../config/routes/local_routes.dart';
import '../../../models/dicas_model.dart';
import '../../../stores/dicas_store.dart';
import '../../../widgets/cards/card_home.dart';
import '../../../widgets/cs_app_bar.dart';
import '../../../widgets/cs_background_app.dart';
import '../../../widgets/cs_content_text.dart';
import '../../../widgets/cs_header_text.dart';
import '../../../widgets/cs_icon.dart';
import '../../../widgets/cs_icon_button.dart';
import '../../../widgets/cs_text_button.dart';
import '../../../widgets/dialogs/cs_alert_dialog_with_content.dart';

class DicasModulosView extends StatefulWidget {
  const DicasModulosView({super.key});

  @override
  State<DicasModulosView> createState() => _DicasModulosViewState();
}

class _DicasModulosViewState extends State<DicasModulosView> {
  void navigation(String route, String title, List<DicaModel> dicas) {
    final args = {
      'title': title,
      'dicas': dicas,
    };

    Navigator.of(context).pushNamed(route, arguments: args);
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
                  text: 'Nesta seção do aplicativo, você encontra dicas de eficiência energética e de como evitar acidentes elétricos.',
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
      appBar: CsAppBar(title: 'Dicas e Informações', actions: [
        CsIconButton(
          icon: const CsIcon(icon: Icons.help_outline_rounded, color: Colors.white),
          tooltip: 'Ajuda',
          onPressed: openDialogHelp,
        ),
      ]),
      body: CsBackgroundApp(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardHome(
                label: 'Eficiência Energética - Dicas',
                icon: AssetsPath.ICON_RAIO,
                onTap: () => navigation(LocalRoutes.SHOW_DICAS, 'Eficiência Energética - Dicas', DicasStore.eficienciaEnergetica),
              ),
              const SizedBox(height: 30),
              CardHome(
                label: 'Evite Acidentes - Dicas',
                icon: AssetsPath.ICON_RAIO,
                onTap: () => navigation(LocalRoutes.SHOW_DICAS, 'Evite Acidentes - Dicas', DicasStore.acidentes),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
