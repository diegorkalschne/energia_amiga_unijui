// ignore_for_file: prefer_final_fields

import 'package:mobx/mobx.dart';

import '../../config/enums.dart';
import '../../models/pergunta_model.dart';
import '../../stores/perguntas_store.dart';

part 'diagnostico_state.g.dart';

class DiagnosticoState = _DiagnosticoState with _$DiagnosticoState;

abstract class _DiagnosticoState with Store {
  _DiagnosticoState(List<PerguntaModel> perguntas) : _perguntas = perguntas.asObservable();

  @observable
  ObservableList<PerguntaModel> _perguntas = ObservableList();

  @observable
  int _currentPergunta = 0;

  @observable
  int _currentViewIndex = 0;

  @computed
  List<PerguntaModel> get perguntas => [..._perguntas];

  @computed
  int get currentPergunta => _currentPergunta;

  @computed
  bool get isLastPergunta => _currentPergunta == _perguntas.length - 1;

  @computed
  int get currentViewIndex => _currentViewIndex;

  (String, ResultadoQuestionario) get checkResult {
    int totalClasseUm = _perguntas.where((e) => e.resposta == RespostaPergunta.sim && e.classe == ClassePergunta.um).length;
    int totalClasseDois = _perguntas.where((e) => e.resposta == RespostaPergunta.sim && e.classe == ClassePergunta.dois).length;
    int totalClasseTres = _perguntas.where((e) => e.resposta == RespostaPergunta.sim && e.classe == ClassePergunta.tres).length;

    if (totalClasseUm > 0) {
      return ('Buscar IMEDIATAMENTE o serviço do profissional legalmente habilitado.', ResultadoQuestionario.urgencia);
    }

    if (totalClasseDois >= 3) {
      return ('Buscar IMEDIATAMENTE o serviço do profissional legalmente habilitado', ResultadoQuestionario.urgencia);
    }

    if (totalClasseDois >= 1 && totalClasseDois <= 2) {
      return ('Observar e agendar uma visita do profissional legalmente habilitado.', ResultadoQuestionario.atencao);
    }

    if (totalClasseTres >= 5) {
      return ('Buscar IMEDIATAMENTE o serviço do profissional legalmente habilitado.', ResultadoQuestionario.urgencia);
    }

    if (totalClasseTres >= 1 && totalClasseTres <= 4) {
      return ('Observar e agendar uma visita do profissional legalmente habilitado.', ResultadoQuestionario.atencao);
    }

    return ('Parece que você não possui problemas com as instalações elétricas da sua residência.\nContudo, se estiver desconfiado (a) de alguma coisa, não deixe de procurar ajuda profissional!', ResultadoQuestionario.seguro);
  }

  @action
  void setResposta(RespostaPergunta resposta) {
    _perguntas[currentPergunta].setResposta(resposta: resposta);
  }

  @action
  void setCurrentPergunta(int index) {
    _currentPergunta = index;
  }

  @action
  void setCurrentViewIndex(int index) {
    _currentViewIndex = index;
  }

  @action
  void resetPerguntas() {
    _perguntas = PerguntasStore().perguntas.asObservable();
    _currentPergunta = 0;
  }
}
