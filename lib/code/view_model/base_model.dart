import 'package:flutter/cupertino.dart';
import 'package:omkar_trading/code/api_service/api_repository.dart';
import 'package:omkar_trading/code/enums/viewstate.dart';

class BaseModel with ChangeNotifier {
  APIRepository _apiRepository = APIRepository();

  APIRepository get apiRepository => _apiRepository;

  set apiRepository(APIRepository value) {
    _apiRepository = value;
    notifyListeners();
  }

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  set state(ViewState viewState) {
    print('State:$viewState');
    _state = viewState;
    notifyListeners();
  }

  set stateWithoutUpdate(ViewState viewState) {
    print('State:$viewState');
    _state = viewState;
  }

  void updateUI() {
    notifyListeners();
  }
}
