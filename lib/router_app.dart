import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'config/enums.dart';
import 'config/routes/local_routes.dart';
import 'models/dicas_model.dart';
import 'models/ebook_model.dart';
import 'services/setup_locator.dart';
import 'stores/app_store.dart';
import 'views/configuracoes/configuracoes_view.dart';
import 'views/descobrindo-eletricidade/descobrindo_eletricidade_view.dart';
import 'views/diagnostico-resultado/diagnostico_resultado_view.dart';
import 'views/diagnostico/diagnostico_view.dart';
import 'views/dicas/dicas-expanded/dicas_expanded_view.dart';
import 'views/dicas/dicas-modulos/dicas_modulos_view.dart';
import 'views/dicas/show-dicas/show_dicas_view.dart';
import 'views/home/home_screen.dart';
import 'views/livros-detalhes/livros_detalhes_view.dart';
import 'views/seguranca-legal/seguranca_legal_view.dart';
import 'views/sobre-projeto/sobre_projeto_view.dart';
import 'views/sobre/sobre_view.dart';
import 'views/splash/splash_screen.dart';

class RouterApp {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LocalRoutes.SPLASH_SCREEN:
        return _PageBuilder(
          child: const SplashScreenView(),
          settings: settings,
        );

      case LocalRoutes.HOME:
        return _PageBuilder(
          child: const HomeScreen(),
          settings: settings,
        );

      case LocalRoutes.SOBRE_PROJETO:
        return _PageBuilder(
          child: const SobreProjetoView(),
          settings: settings,
        );

      case LocalRoutes.SEGURANCA_LEGAL:
        return _PageBuilder(
          child: const SegurancaLegalView(),
          settings: settings,
        );

      case LocalRoutes.DESCOBRINDO_ELETRICIDADE:
        return _PageBuilder(
          child: const DescobrindoEletricidadeView(),
          settings: settings,
        );

      case LocalRoutes.DIAGNOSTICO:
        return _PageBuilder(
          child: const DiagnosticoView(),
          settings: settings,
        );

      case LocalRoutes.LIVROS_DETALHES:
        final book = settings.arguments as EbookModel;

        return _PageBuilder(
          child: LivrosDetalhesView(book: book),
          settings: settings,
        );

      case LocalRoutes.DIANOSTICO_RESULTADO:
        final text = (settings.arguments as Map)['text'] as String;
        final resultado = (settings.arguments as Map)['result'] as ResultadoQuestionario;

        return _PageBuilder(
          child: DiagnosticoResultadoView(
            text: text,
            resultado: resultado,
          ),
          settings: settings,
        );

      case LocalRoutes.DICAS_MODULOS:
        return _PageBuilder(
          child: const DicasModulosView(),
          settings: settings,
        );

      case LocalRoutes.SHOW_DICAS:
        final title = (settings.arguments as Map)['title'] as String;
        final dicas = (settings.arguments as Map)['dicas'] as List<DicaModel>;

        return _PageBuilder(
          child: ShowDicasView(
            dicas: dicas,
            title: title,
          ),
          settings: settings,
        );

      case LocalRoutes.DICAS_EXPANDED:
        final dica = settings.arguments as DicaModel;

        return _PageBuilder(
          child: DicasExpandedView(dica: dica),
          settings: settings,
        );

      case LocalRoutes.SOBRE:
        return _PageBuilder(
          child: const SobreView(),
          settings: settings,
        );

      case LocalRoutes.CONFIGURACOES:
        return _PageBuilder(
          child: const ConfiguracoesView(),
          settings: settings,
        );

      default:
        return _PageBuilder(
          child: const SizedBox(),
          settings: settings,
        );
    }
  }
}

class _PageBuilder extends PageRouteBuilder {
  ///Responsável pelo efeito de 'fade transition' entre as transições de telas
  _PageBuilder({
    required this.child,
    required this.settings,
  }) : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 100),
          transitionDuration: const Duration(milliseconds: 700),
          transitionsBuilder: (context, animation, secAnimation, child) {
            final fadeAnimation = CurvedAnimation(
              curve: Curves.easeInToLinear,
              reverseCurve: Curves.easeInToLinear,
              parent: animation,
            );

            final appStore = getIt<AppStore>();

            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Observer(
                builder: (_) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaler: TextScaler.linear(appStore.textFactor),
                      alwaysUse24HourFormat: true,
                    ),
                    child: Stack(
                      children: [
                        Container(color: Theme.of(context).scaffoldBackgroundColor),
                        FadeTransition(
                          opacity: fadeAnimation,
                          child: child,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
          pageBuilder: (context, animation, secAnimation) => child,
        );

  final Widget child;

  @override
  final RouteSettings settings;
}
