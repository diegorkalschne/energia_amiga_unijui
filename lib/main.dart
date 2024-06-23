import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/constants.dart';
import 'config/routes/local_routes.dart';
import 'config/theme/theme_app.dart';
import 'router_app.dart';
import 'services/setup_locator.dart';
import 'services/shared_service.dart';
import 'stores/app_store.dart';
import 'widgets/no_glow_effect.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  LicenseRegistry.addLicense(() async* {
    final kleeOneLicence = await rootBundle.loadString('fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], kleeOneLicence);
  });

  setupLocator();

  retrieveConfiguracoes();

  runApp(const EnergiaAmigaApp());
}

void retrieveConfiguracoes() async {
  final appStore = getIt<AppStore>();

  final textFactor = (await SharedService.getDouble(SharedKeys.TEXT_FACTOR)) ?? 1;
  appStore.setTextFactor(textFactor);
}

class EnergiaAmigaApp extends StatelessWidget {
  const EnergiaAmigaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Energia Amiga',
      themeMode: ThemeMode.light,
      theme: ThemeApp.ligthTheme,
      builder: (_, child) {
        return ScrollConfiguration(
          behavior: const NoGlowEffect(),
          child: child!,
        );
      },
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('pt', 'BR')],
      initialRoute: LocalRoutes.SPLASH_SCREEN,
      onGenerateRoute: RouterApp.onGenerateRoute,
    );
  }
}
