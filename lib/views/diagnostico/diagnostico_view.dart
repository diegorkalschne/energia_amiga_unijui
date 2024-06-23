import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../config/constants.dart';
import '../../config/enums.dart';
import '../../config/routes/local_routes.dart';
import '../../models/pergunta_model.dart';
import '../../services/setup_locator.dart';
import '../../services/shared_service.dart';
import '../../widgets/cs_app_bar.dart';
import '../../widgets/cs_background_app.dart';
import '../../widgets/cs_content_text.dart';
import '../../widgets/cs_elevated_button.dart';
import '../../widgets/cs_header_text.dart';
import '../../widgets/cs_icon.dart';
import '../../widgets/cs_icon_button.dart';
import '../../widgets/cs_radio_list_tile.dart';
import '../../widgets/cs_text_button.dart';
import '../../widgets/dialogs/cs_alert_dialog_with_content.dart';
import 'diagnostico_state.dart';

class DiagnosticoView extends StatefulWidget {
  const DiagnosticoView({super.key});

  @override
  State<DiagnosticoView> createState() => _DiagnosticoViewState();
}

class _DiagnosticoViewState extends State<DiagnosticoView> {
  final stateView = getIt<DiagnosticoState>();

  final pageController = PageController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      checkVisualizouIntroducao();
    });
  }

  @override
  void dispose() {
    stateView.resetPerguntas();

    super.dispose();
  }

  void checkVisualizouIntroducao() async {
    try {
      final result = (await SharedService.getBool(SharedKeys.VISUALIZOU_INTRODUCAO_DIAGNOSTICO)) ?? false;

      stateView.setCurrentViewIndex(result ? 1 : 0);
    } catch (_) {
      stateView.setCurrentViewIndex(0);
    }
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
                  text: 'A ferramenta de análise de instalações elétricas ajudará você a analisar as suas instalações elétricas e dar orientações de como prosseguir em casos de alerta.',
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
        title: 'Diagnóstico de Instalações',
        actions: [
          Observer(
            builder: (_) {
              return Visibility(
                visible: stateView.currentViewIndex == 1,
                child: CsIconButton(
                  icon: const CsIcon(icon: Icons.help_outline_rounded, color: Colors.white),
                  tooltip: 'Ajuda',
                  onPressed: openDialogHelp,
                ),
              );
            },
          ),
        ],
      ),
      body: CsBackgroundApp(
        child: Observer(
          builder: (_) {
            return IndexedStack(
              index: stateView.currentViewIndex,
              children: [
                //Introdução
                Center(
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CsHeaderText(title: 'Ferramenta de Análise de Instalações Elétricas', maxLines: 2),
                            const SizedBox(height: 10),
                            const CsContentText(text: 'Bem-vindo ao nosso Diagnóstico de Instalações Elétricas! Este recurso foi desenvolvido para ajudá-lo a garantir a segurança e a eficiência de sua instalação elétrica. Através de uma série de perguntas simples de SIM ou NÃO, avaliaremos o estado da sua instalação e forneceremos recomendações claras, como a necessidade de chamar um profissional qualificado, manter a atenção em alguns pontos críticos ou a confirmação de que está tudo seguro. Responda com sinceridade para obter o diagnóstico mais preciso e garantir a segurança do seu lar ou estabelecimento.'),
                            const SizedBox(height: 20),
                            CsElevatedButton.secondary(
                              label: 'Fechar',
                              onPressed: () async {
                                await SharedService.saveBool(SharedKeys.VISUALIZOU_INTRODUCAO_DIAGNOSTICO, true);

                                stateView.setCurrentViewIndex(1); //Mostra as perguntas
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Perguntas
                PageView.builder(
                  itemCount: stateView.perguntas.length,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                  onPageChanged: (index) {
                    stateView.setCurrentPergunta(index);
                  },
                  itemBuilder: (_, index) {
                    final pergunta = stateView.perguntas[index];

                    return _PerguntaView(
                      pergunta: pergunta,
                      index: index,
                      controller: pageController,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _PerguntaView extends StatefulWidget {
  const _PerguntaView({
    required this.pergunta,
    required this.index,
    required this.controller,
  });

  final PerguntaModel pergunta;
  final int index;
  final PageController controller;

  @override
  State<_PerguntaView> createState() => _PerguntaViewState();
}

class _PerguntaViewState extends State<_PerguntaView> {
  final stateView = getIt<DiagnosticoState>();

  void navigateTo(int page) {
    widget.controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Observer(
                    builder: (_) {
                      return CsHeaderText(title: 'Pergunta ${stateView.currentPergunta + 1}/${stateView.perguntas.length}');
                    },
                  ),
                  const SizedBox(height: 20),
                  CsContentText(text: widget.pergunta.pergunta),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Observer(
                          builder: (_) {
                            return CsRadioListTile<RespostaPergunta>(
                              value: RespostaPergunta.sim,
                              groupValue: widget.pergunta.resposta,
                              title: 'Sim',
                              onChanged: (value) {
                                stateView.setResposta(value!);
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Observer(
                          builder: (_) {
                            return CsRadioListTile<RespostaPergunta>(
                              value: RespostaPergunta.nao,
                              groupValue: widget.pergunta.resposta,
                              title: 'Não',
                              onChanged: (value) {
                                stateView.setResposta(value!);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Observer(
                    builder: (_) {
                      return CsElevatedButton.secondary(
                        label: stateView.isLastPergunta ? 'Finalizar' : 'Próxima',
                        onPressed: () {
                          if (stateView.isLastPergunta) {
                            final (String, ResultadoQuestionario) result = stateView.checkResult;

                            final args = {
                              'text': result.$1,
                              'result': result.$2,
                            };

                            Navigator.of(context).popAndPushNamed(LocalRoutes.DIANOSTICO_RESULTADO, arguments: args);
                          } else {
                            int nextPage = stateView.currentPergunta + 1;
                            navigateTo(nextPage);
                          }
                        },
                      );
                    },
                  ),
                  Observer(
                    builder: (_) {
                      return Visibility(
                        visible: stateView.currentPergunta > 0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: CsTextButton(
                            label: 'Voltar',
                            onPressed: () {
                              int previousPage = stateView.currentPergunta - 1;
                              navigateTo(previousPage);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
