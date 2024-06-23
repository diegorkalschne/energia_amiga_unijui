import 'package:flutter/material.dart';

import '../../config/assets/assets_path.dart';
import '../../config/routes/local_routes.dart';
import '../../widgets/cards/card_home.dart';
import '../../widgets/cs_app_bar.dart';
import '../../widgets/cs_background_app.dart';
import '../../widgets/menu/cs_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigation(String route) {
    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(title: 'Energia Amiga'),
      drawer: const CsMenu(),
      body: CsBackgroundApp(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CardHome(
                      label: 'O Projeto',
                      icon: AssetsPath.ICON_AJUDA,
                      onTap: () => navigation(LocalRoutes.SOBRE_PROJETO),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CardHome(
                      label: 'Dicas e Informações',
                      icon: AssetsPath.ICON_DICAS,
                      onTap: () => navigation(LocalRoutes.DICAS_MODULOS),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: CardHome(
                      label: 'Segurança Legal',
                      icon: AssetsPath.ICON_CADEADO,
                      onTap: () => navigation(LocalRoutes.SEGURANCA_LEGAL),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CardHome(
                      label: 'Descobrindo a Eletricidade',
                      icon: AssetsPath.ICON_LIVRO,
                      onTap: () => navigation(LocalRoutes.DESCOBRINDO_ELETRICIDADE),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CardHome(
                label: 'Diagnóstico de Instalações',
                icon: AssetsPath.ICON_RAIO,
                onTap: () => navigation(LocalRoutes.DIAGNOSTICO),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
