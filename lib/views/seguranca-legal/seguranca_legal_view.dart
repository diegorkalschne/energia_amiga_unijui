import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../widgets/cs_app_bar.dart';
import '../../widgets/cs_content_text.dart';
import '../../widgets/cs_elevated_button.dart';
import '../../widgets/cs_header_text.dart';
import '../../widgets/cs_icon.dart';
import '../../widgets/cs_icon_button.dart';
import '../../widgets/cs_text_button.dart';
import '../../widgets/dialogs/cs_alert_dialog_with_content.dart';
import 'seguranca_legal_state.dart';

class SegurancaLegalView extends StatefulWidget {
  const SegurancaLegalView({super.key});

  @override
  State<SegurancaLegalView> createState() => _SegurancaLegalViewState();
}

class _SegurancaLegalViewState extends State<SegurancaLegalView> {
  final stateView = SegurancaLegalState();

  final pageController = PageController();

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
                  text: 'Nesta seção do aplicativo, você encontra dicas de segurança elétricas em situações de catástrofes.',
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
      appBar: CsAppBar(
        title: 'Segurança Legal',
        actions: [
          CsIconButton(
            icon: const CsIcon(icon: Icons.help_outline_rounded, color: Colors.white),
            tooltip: 'Ajuda',
            onPressed: openDialogHelp,
          ),
        ],
      ),
      body: PageView.builder(
        itemCount: 6,
        onPageChanged: (index) {
          stateView.setCurrentIndex(index);
        },
        controller: pageController,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: Semantics(
                    label: 'Imagem ${index + 1} do segurança legal',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/seguranca-legal/${index + 1}.jpeg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Observer(
                  builder: (_) {
                    return Visibility(
                      visible: stateView.currentIndex < 5,
                      child: CsElevatedButton.secondary(
                        label: 'Próxima',
                        onPressed: () {
                          int page = stateView.currentIndex == 5 ? 4 : stateView.currentIndex + 1;

                          pageController.animateToPage(
                            page,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linearToEaseOut,
                          );
                        },
                      ),
                    );
                  },
                ),
                Observer(
                  builder: (_) {
                    return Visibility(
                      visible: stateView.currentIndex > 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CsTextButton(
                          label: 'Voltar',
                          onPressed: () {
                            int page = stateView.currentIndex - 1;

                            pageController.animateToPage(
                              page,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linearToEaseOut,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
