import 'package:get_it/get_it.dart';

import '../stores/app_store.dart';
import '../stores/perguntas_store.dart';
import '../views/diagnostico/diagnostico_state.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => DiagnosticoState(PerguntasStore().perguntas));

  getIt.registerSingleton(AppStore());
}
