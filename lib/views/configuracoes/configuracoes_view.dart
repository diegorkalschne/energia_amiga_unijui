import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../config/constants.dart';
import '../../services/setup_locator.dart';
import '../../services/shared_service.dart';

import '../../stores/app_store.dart';
import '../../widgets/cs_app_bar.dart';

import '../../widgets/cs_slider_config.dart';

class ConfiguracoesView extends StatefulWidget {
  const ConfiguracoesView({super.key});

  @override
  State<ConfiguracoesView> createState() => _ConfiguracoesViewState();
}

class _ConfiguracoesViewState extends State<ConfiguracoesView> {
  final appStore = getIt<AppStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(
        title: 'Configurações',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Acessibilidade
            _HeaderSection(
              label: 'Acessibilidade',
              children: [
                // Altera o tamanho da fonte do aplicativo
                Observer(
                  builder: (_) {
                    return CsSliderConfig(
                      value: appStore.textFactor,
                      onChanged: (factor) async {
                        appStore.setTextFactor(factor);

                        await SharedService.saveDouble(SharedKeys.TEXT_FACTOR, factor);
                      },
                      min: 1,
                      max: 1.5,
                      divisions: 4,
                      label: 'Alterar tamanho da fonte do aplicativo',
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({
    required this.label,
    required this.children,
  });

  final String label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 5,
      color: Colors.grey[50],
      margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: theme.colorScheme.onPrimary,
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 15),
            Divider(
              color: theme.colorScheme.onSurface.withOpacity(0.2),
              endIndent: 5,
              indent: 5,
              thickness: 1,
              height: 0,
            ),
            Column(children: children),
          ],
        ),
      ),
    );
  }
}
