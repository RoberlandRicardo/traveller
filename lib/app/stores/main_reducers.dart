import 'package:traveller/app/stores/actions.dart';
import 'package:traveller/app/stores/app_state.dart';
import 'package:traveller/app/stores/reducers/listTravels.dart';
import 'package:traveller/app/stores/reducers/offAuthentication.dart';
import 'package:traveller/app/stores/reducers/sessao.dart';

AppState _reducers(AppState state, AppAction action, dynamic payload) {
  switch (action) {
    case AppAction.setToken:
      return setToken(state, payload);

    case AppAction.setSessao:
      return setSessao(state, payload);

    case AppAction.removeSessao:
      return removeSessao(state, payload);

    case AppAction.activateOffAuthentication:
      return activateOffAuthentication(state, payload);

    case AppAction.desactivateOffAuthentication:
      return desactivateOffAuthentication(state, payload);

    case AppAction.setListTravels:
      return setListTravels(state, payload);
  }
}

AppState Function(AppState, AppAction, dynamic) get reducers => _reducers;
