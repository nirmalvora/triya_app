import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> isInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    // Neither mobile data or WIFI detected, not internet connection found.
    return false;
  }
}
