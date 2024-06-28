import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../models/dicas_model.dart';
import '../../../widgets/cs_app_bar.dart';
import '../../../widgets/cs_circular_progress_indicador.dart';
import '../../../widgets/cs_elevated_button.dart';
import '../../../widgets/cs_header_text.dart';
import '../../../widgets/cs_youtube_player.dart';

class DicasExpandedView extends StatefulWidget {
  const DicasExpandedView({
    required this.dica,
    super.key,
  });

  final DicaModel dica;

  @override
  State<DicasExpandedView> createState() => _DicasExpandedViewState();
}

class _DicasExpandedViewState extends State<DicasExpandedView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final pageKey = const PageStorageKey('dicas_expanded');
  final pageController = PageController();

  ByteData? pdfBytes;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: const CsAppBar(title: 'Dicas'),
      body: Padding(
        padding: const EdgeInsets.all(10).copyWith(bottom: 0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CsHeaderText(title: widget.dica.title),
            const SizedBox(height: 10),
            Expanded(
              child: PageView(
                key: pageKey,
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: FutureBuilder<ByteData>(
                          future: (() async {
                            if (pdfBytes != null) {
                              return pdfBytes!;
                            }

                            return await rootBundle.load(widget.dica.pdfAsset);
                          })(),
                          builder: (context, snap) {
                            if (snap.connectionState == ConnectionState.waiting) {
                              return const CsCircularProgressIndicador.dark(withMessage: true);
                            }

                            if (snap.data == null) {
                              return const SizedBox();
                            }

                            pdfBytes = snap.data;

                            return ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SfPdfViewer.memory(
                                snap.data!.buffer.asUint8List(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      CsElevatedButton.secondary(
                        label: 'Ver vídeo',
                        onPressed: () {
                          pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linearToEaseOut,
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CsYoutubePlayer(link: widget.dica.videoUrl),
                        ),
                      ),
                      const SizedBox(height: 10),
                      CsElevatedButton.secondary(
                        label: 'Voltar',
                        onPressed: () {
                          pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linearToEaseOut,
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
