import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  double _textFactor = 1;

  @computed
  double get textFactor => _textFactor;

  @action
  void setTextFactor(double factor) {
    _textFactor = factor;
  }
}
