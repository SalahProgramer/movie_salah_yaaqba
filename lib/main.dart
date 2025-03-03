import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_salah_yaaqba/view/movie_app.dart';
void main() {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    // ErrorWidget.builder = (FlutterErrorDetails details) {
    //   return Container(
    //     alignment: Alignment.center,
    //     child: Text(
    //       "Error\n${details.exception}",
    //     ),
    //   );
    // };

  } catch (e) {
    // FlutterError.reportError(FlutterErrorDetails(
    //     exception: e,
    //     library: "Message 1",
    //     context: ErrorSummary("Message 2")));
  }

  runApp(
      // MultiProvider(
    // providers: providers,
    // child:
    MovieApp(),
  // )

  );
}


