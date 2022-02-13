import 'package:traveller/app/stores/actions.dart';
import 'package:traveller/app/stores/app_state.dart';
import 'package:traveller/app/stores/reducers/list_travels.dart';
import 'package:traveller/app/stores/reducers/location_user.dart';
import 'package:traveller/app/stores/reducers/off_authentication.dart';
import 'package:traveller/app/stores/reducers/sessao.dart';
import 'package:traveller/app/stores/reducers/travel_cadastro.dart';

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

    case AppAction.setTravelCadastro:
      return setTravelCadastro(state, payload);

    case AppAction.initTravelCadastro:
      return initTravelCadastro(state, payload);

    case AppAction.closeTravelCadastro:
      return closeTravelCadastro(state, payload);

    case AppAction.setLocationUser:
      return setLocationUser(state, payload);
  }
}

AppState Function(AppState, AppAction, dynamic) get reducers => _reducers;
