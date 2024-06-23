// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pergunta_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PerguntaModel on _PerguntaModel, Store {
  Computed<RespostaPergunta>? _$respostaComputed;

  @override
  RespostaPergunta get resposta =>
      (_$respostaComputed ??= Computed<RespostaPergunta>(() => super.resposta,
              name: '_PerguntaModel.resposta'))
          .value;

  late final _$_respostaAtom =
      Atom(name: '_PerguntaModel._resposta', context: context);

  @override
  RespostaPergunta get _resposta {
    _$_respostaAtom.reportRead();
    return super._resposta;
  }

  @override
  set _resposta(RespostaPergunta value) {
    _$_respostaAtom.reportWrite(value, super._resposta, () {
      super._resposta = value;
    });
  }

  late final _$_PerguntaModelActionController =
      ActionController(name: '_PerguntaModel', context: context);

  @override
  void setResposta({required RespostaPergunta resposta}) {
    final _$actionInfo = _$_PerguntaModelActionController.startAction(
        name: '_PerguntaModel.setResposta');
    try {
      return super.setResposta(resposta: resposta);
    } finally {
      _$_PerguntaModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
resposta: ${resposta}
    ''';
  }
}
