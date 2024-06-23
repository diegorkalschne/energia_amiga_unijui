import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/assets/assets_path.dart';
import '../../config/enums.dart';
import '../../widgets/cs_app_bar.dart';
import '../../widgets/cs_background_app.dart';
import '../../widgets/cs_content_text.dart';
import '../../widgets/cs_elevated_button.dart';
import '../../widgets/cs_header_text.dart';

class DiagnosticoResultadoView extends StatefulWidget {
  const DiagnosticoResultadoView({
    required this.text,
    required this.resultado,
    super.key,
  });

  final String text;
  final ResultadoQuestionario resultado;

  @override
  State<DiagnosticoResultadoView> createState() => _DiagnosticoResultadoViewState();
}

class _DiagnosticoResultadoViewState extends State<DiagnosticoResultadoView> {
  String get imageResult {
    return switch (widget.resultado) {
      ResultadoQuestionario.atencao => AssetsPath.ATTENTION_RESULT,
      ResultadoQuestionario.seguro => AssetsPath.SUCCESS_RESULT,
      ResultadoQuestionario.urgencia => AssetsPath.WARNING_RESULT,
    };
  }

  String get titleResult {
    return switch (widget.resultado) {
      ResultadoQuestionario.atencao => 'Atenção',
      ResultadoQuestionario.seguro => 'Parabéns',
      ResultadoQuestionario.urgencia => 'Cuidado',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(title: 'Diagnóstico de Instalações'),
      body: CsBackgroundApp(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      CsHeaderText(
                        title: titleResult,
                        fontSize: 32,
                      ),
                      SvgPicture.asset(
                        imageResult,
                        width: 300,
                        height: 350,
                      ),
                      const SizedBox(height: 10),
                      CsContentText(
                        text: widget.text,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      CsElevatedButton.secondary(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        label: 'Voltar',
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
