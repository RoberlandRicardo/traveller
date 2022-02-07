import 'package:traveller/app/models/sessao.dart';
import 'package:traveller/app/stores/actions.dart';
import 'package:traveller/app/stores/reducers.dart';
import 'package:traveller/app/stores/store.dart';

class AppState {
  Sessao? sessao;

  AppState({this.sessao});
}

final appStore =
    Store<AppAction, AppState>(initialState: AppState(), reducer: reducers);
