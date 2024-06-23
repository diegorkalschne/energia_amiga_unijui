// ignore_for_file: unused_element

import 'package:mobx/mobx.dart';

import '../config/enums.dart';

part 'pergunta_model.g.dart';

class PerguntaModel = _PerguntaModel with _$PerguntaModel;

abstract class _PerguntaModel with Store {
  _PerguntaModel.classeUm(this.pergunta) : classe = ClassePergunta.um;

  _PerguntaModel.classeDois(this.pergunta) : classe = ClassePergunta.dois;

  _PerguntaModel.classeTres(this.pergunta) : classe = ClassePergunta.tres;

  late final String pergunta;
  late final ClassePergunta classe;

  @observable
  RespostaPergunta _resposta = RespostaPergunta.nao;

  @computed
  RespostaPergunta get resposta => _resposta;

  @action
  void setResposta({required RespostaPergunta resposta}) {
    _resposta = resposta;
  }
}
