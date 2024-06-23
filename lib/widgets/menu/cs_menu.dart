import 'package:flutter/material.dart';

import '../../config/assets/assets_path.dart';
import '../../config/routes/local_routes.dart';
import '../cs_background_app.dart';
import 'cs_button_item_menu.dart';

class CsMenu extends StatelessWidget {
  const CsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: CsBackgroundApp(
        fit: BoxFit.fill,
        child: ListView(
          children: [
            Image.asset(
              AssetsPath.ENERGIA_AMIGA_LOGO,
              height: 200,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            Divider(
              color: theme.colorScheme.primary,
              thickness: 1.5,
              height: 5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CsButtonItemMenu(
                    icon: Icons.info_outline_rounded,
                    title: 'Sobre',
                    onTap: () {
                      Navigator.of(context).popAndPushNamed(LocalRoutes.SOBRE);
                    },
                  ),
                  CsButtonItemMenu(
                    icon: Icons.settings,
                    title: 'Configurações',
                    onTap: () {
                      Navigator.of(context).popAndPushNamed(LocalRoutes.CONFIGURACOES);
                    },
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
