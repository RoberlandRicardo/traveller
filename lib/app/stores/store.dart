import 'package:flutter/material.dart' hide Action, State;

class Store<Action, State> extends ChangeNotifier {
  State _state;
  final State Function(State state, Action action, dynamic payload) reducer;

  Store({required initialState, required this.reducer}) : _state = initialState;
  State get state => _state;

  void dispatcher({required Action action, dynamic payload}) {
    _state = reducer(state, action, payload);
    notifyListeners();
  }
}
