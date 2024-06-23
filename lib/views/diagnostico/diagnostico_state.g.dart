// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnostico_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DiagnosticoState on _DiagnosticoState, Store {
  Computed<List<PerguntaModel>>? _$perguntasComputed;

  @override
  List<PerguntaModel> get perguntas => (_$perguntasComputed ??=
          Computed<List<PerguntaModel>>(() => super.perguntas,
              name: '_DiagnosticoState.perguntas'))
      .value;
  Computed<int>? _$currentPerguntaComputed;

  @override
  int get currentPergunta =>
      (_$currentPerguntaComputed ??= Computed<int>(() => super.currentPergunta,
              name: '_DiagnosticoState.currentPergunta'))
          .value;
  Computed<bool>? _$isLastPerguntaComputed;

  @override
  bool get isLastPergunta =>
      (_$isLastPerguntaComputed ??= Computed<bool>(() => super.isLastPergunta,
              name: '_DiagnosticoState.isLastPergunta'))
          .value;
  Computed<int>? _$currentViewIndexComputed;

  @override
  int get currentViewIndex => (_$currentViewIndexComputed ??= Computed<int>(
          () => super.currentViewIndex,
          name: '_DiagnosticoState.currentViewIndex'))
      .value;

  late final _$_perguntasAtom =
      Atom(name: '_DiagnosticoState._perguntas', context: context);

  @override
  ObservableList<PerguntaModel> get _perguntas {
    _$_perguntasAtom.reportRead();
    return super._perguntas;
  }

  @override
  set _perguntas(ObservableList<PerguntaModel> value) {
    _$_perguntasAtom.reportWrite(value, super._perguntas, () {
      super._perguntas = value;
    });
  }

  late final _$_currentPerguntaAtom =
      Atom(name: '_DiagnosticoState._currentPergunta', context: context);

  @override
  int get _currentPergunta {
    _$_currentPerguntaAtom.reportRead();
    return super._currentPergunta;
  }

  @override
  set _currentPergunta(int value) {
    _$_currentPerguntaAtom.reportWrite(value, super._currentPergunta, () {
      super._currentPergunta = value;
    });
  }

  late final _$_currentViewIndexAtom =
      Atom(name: '_DiagnosticoState._currentViewIndex', context: context);

  @override
  int get _currentViewIndex {
    _$_currentViewIndexAtom.reportRead();
    return super._currentViewIndex;
  }

  @override
  set _currentViewIndex(int value) {
    _$_currentViewIndexAtom.reportWrite(value, super._currentViewIndex, () {
      super._currentViewIndex = value;
    });
  }

  late final _$_DiagnosticoStateActionController =
      ActionController(name: '_DiagnosticoState', context: context);

  @override
  void setResposta(RespostaPergunta resposta) {
    final _$actionInfo = _$_DiagnosticoStateActionController.startAction(
        name: '_DiagnosticoState.setResposta');
    try {
      return super.setResposta(resposta);
    } finally {
      _$_DiagnosticoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentPergunta(int index) {
    final _$actionInfo = _$_DiagnosticoStateActionController.startAction(
        name: '_DiagnosticoState.setCurrentPergunta');
    try {
      return super.setCurrentPergunta(index);
    } finally {
      _$_DiagnosticoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentViewIndex(int index) {
    final _$actionInfo = _$_DiagnosticoStateActionController.startAction(
        name: '_DiagnosticoState.setCurrentViewIndex');
    try {
      return super.setCurrentViewIndex(index);
    } finally {
      _$_DiagnosticoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPerguntas() {
    final _$actionInfo = _$_DiagnosticoStateActionController.startAction(
        name: '_DiagnosticoState.resetPerguntas');
    try {
      return super.resetPerguntas();
    } finally {
      _$_DiagnosticoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
perguntas: ${perguntas},
currentPergunta: ${currentPergunta},
isLastPergunta: ${isLastPergunta},
currentViewIndex: ${currentViewIndex}
    ''';
  }
}
