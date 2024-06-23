import 'package:flutter/material.dart';

import '../../../config/routes/local_routes.dart';
import '../../../models/dicas_model.dart';
import '../../../widgets/cards/card_dicas.dart';
import '../../../widgets/cs_app_bar.dart';
import '../../../widgets/cs_background_app.dart';

class ShowDicasView extends StatefulWidget {
  const ShowDicasView({
    required this.dicas,
    required this.title,
    super.key,
  });

  final List<DicaModel> dicas;
  final String title;

  @override
  State<ShowDicasView> createState() => _ShowDicasViewState();
}

class _ShowDicasViewState extends State<ShowDicasView> {
  void onSelectDica(DicaModel dica) {
    Navigator.of(context).pushNamed(LocalRoutes.DICAS_EXPANDED, arguments: dica);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CsAppBar(title: widget.title),
      body: CsBackgroundApp(
        child: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: widget.dicas.length,
          itemBuilder: (_, index) {
            final dica = widget.dicas[index];
        
            return CardDicas(
              dica: dica,
              onTap: onSelectDica,
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: 10),
        ),
      ),
    );
  }
}
