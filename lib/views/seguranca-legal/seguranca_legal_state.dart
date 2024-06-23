import 'package:mobx/mobx.dart';

part 'seguranca_legal_state.g.dart';

class SegurancaLegalState = _SegurancaLegalState with _$SegurancaLegalState;

abstract class _SegurancaLegalState with Store {
  @observable
  int _currentIndex = 0;

  @computed
  int get currentIndex => _currentIndex;

  @action
  void setCurrentIndex(int index) {
    _currentIndex = index;
  }
}
