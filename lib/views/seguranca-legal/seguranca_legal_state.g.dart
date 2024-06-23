// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seguranca_legal_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SegurancaLegalState on _SegurancaLegalState, Store {
  Computed<int>? _$currentIndexComputed;

  @override
  int get currentIndex =>
      (_$currentIndexComputed ??= Computed<int>(() => super.currentIndex,
              name: '_SegurancaLegalState.currentIndex'))
          .value;

  late final _$_currentIndexAtom =
      Atom(name: '_SegurancaLegalState._currentIndex', context: context);

  @override
  int get _currentIndex {
    _$_currentIndexAtom.reportRead();
    return super._currentIndex;
  }

  @override
  set _currentIndex(int value) {
    _$_currentIndexAtom.reportWrite(value, super._currentIndex, () {
      super._currentIndex = value;
    });
  }

  late final _$_SegurancaLegalStateActionController =
      ActionController(name: '_SegurancaLegalState', context: context);

  @override
  void setCurrentIndex(int index) {
    final _$actionInfo = _$_SegurancaLegalStateActionController.startAction(
        name: '_SegurancaLegalState.setCurrentIndex');
    try {
      return super.setCurrentIndex(index);
    } finally {
      _$_SegurancaLegalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
