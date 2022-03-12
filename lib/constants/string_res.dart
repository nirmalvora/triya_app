import 'package:triya_app/local_data/app_state.dart';

typedef JsonPayLoad = Map<String, dynamic>;

AppState appState = AppState();

class StringRes {
  static const error = 'error';
  static const pleaseTryAgain = 'Please try again';
  static const success = 'success';

  // Network
  static const errorGeneral = 'errorGeneral';
  static const errorRequestCancelled = 'errorRequestCancelled';
  static const errorRequestTimeout =
      'Unable to connect to server. Kindly check your internet connection!';
  static const noInternetMessage =
      'Slow or no internet connection. Please check your internet settings.';
  static const somethingWentWrong = 'Something went wrong. Please try again.';
  static const serverTimeout = 'Server timeout';
  static const pleaseCheckInternet = 'Please Check Internet';
  static const errorTitle = 'Oops! something\'s missing...';
  static const errorDescription =
      'It seems like we can\'t find what you searched. The page you are looking for doesn\'t exist, isn\'t available or was loading incorrectly.';
  static const grantPermission =
      'Please grant storage permission from settings';
  static const appName = 'Base Project';
  static const cameraPermission =
      'Please allow camera permission to Upload Photo';
  static const getHelp = 'Get Help';
  static const logOut = 'Log Out';
  static const loginSso = 'Login wih SSO';
  static const loginGoogle = 'Google SignIN';
  static const loginApple = 'Apple SignIn';
  static const loginLinkdein = 'Linkdein SignIN';
  static const okay = 'Okay';
  static const ok = 'OK';
  static const yes = 'Yes';
  static const no = 'No';
  static const save = 'Save';
  static const skip = 'Skip';
  static const camera = 'Camera';
  static const gallery = 'Gallery';
  static const areYouSureLogout = 'Are you sure want to logout?';
  static const continueTxt = 'Continue';

  //Validations
  static const rottedDevice = 'Rotted Device';
  static const jailBreakDevice = 'Jailbreak Device';

  static const noName = 'No name defined';
  static const tokenIsExpired = 'Token is expired.';
}

class SharedPrefConst {
  static const loggedSso = 'logged';
  static const token = 'token';
}
