// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on _AppStore, Store {
  Computed<double>? _$textFactorComputed;

  @override
  double get textFactor =>
      (_$textFactorComputed ??= Computed<double>(() => super.textFactor,
              name: '_AppStore.textFactor'))
          .value;

  late final _$_textFactorAtom =
      Atom(name: '_AppStore._textFactor', context: context);

  @override
  double get _textFactor {
    _$_textFactorAtom.reportRead();
    return super._textFactor;
  }

  @override
  set _textFactor(double value) {
    _$_textFactorAtom.reportWrite(value, super._textFactor, () {
      super._textFactor = value;
    });
  }

  late final _$_AppStoreActionController =
      ActionController(name: '_AppStore', context: context);

  @override
  void setTextFactor(double factor) {
    final _$actionInfo = _$_AppStoreActionController.startAction(
        name: '_AppStore.setTextFactor');
    try {
      return super.setTextFactor(factor);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textFactor: ${textFactor}
    ''';
  }
}
