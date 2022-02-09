import 'package:traveller/app/models/sessao.dart';
import 'package:traveller/app/stores/actions.dart';
import 'package:traveller/app/stores/main_reducers.dart';
import 'package:traveller/app/stores/store.dart';
import 'package:traveller/app/models/travel.dart';

class AppState {
  Sessao? sessao;
  bool? offAuthentication;
  Travel? travelCadastro;
  List<Travel>? listTravels = [];

  AppState(
      {this.sessao,
      this.offAuthentication,
      this.listTravels,
      this.travelCadastro});
}

final appStore =
    Store<AppAction, AppState>(initialState: AppState(), reducer: reducers);
