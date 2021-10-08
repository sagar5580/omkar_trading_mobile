import 'package:connectivity/connectivity.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'code/enums/connection_status.dart';
import 'code/utils/connectivity_helper.dart';
import 'code/utils/locator.dart';
import 'code/view_model/network_view_model.dart';


List<SingleChildWidget> providers = [
  ...uiConsumableProviders,
];

List<SingleChildWidget> independentServices = [];

List<SingleChildWidget> dependentServices = [];

List<SingleChildWidget> uiConsumableProviders = [
  ValueListenableProvider<ConnectivityResult>.value(
      value: locator<NetworkViewModel>().connectivityResultStatus),
  StreamProvider<ConnectionStatus>.value(
    value: ConnectivityService().connectivityController.stream,
    initialData: ConnectionStatus.offline,
  ),
  // ChangeNotifierProvider(create: (_) => UserDataViewModel()),
];
