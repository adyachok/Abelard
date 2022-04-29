import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pegasus/pages/welcome_page.dart';
import 'package:pegasus/providers/selected_horse_provider.dart';
import 'package:provider/provider.dart';

import 'blocs/insulin_measurement_bloc.dart';
import 'blocs/insulin_measurement_states.dart';
import 'notifications.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState()  {
    super.initState();

    // Run code required to handle interacted messages in an async function
    // as initState() must not be async
    var initializeAndroidSettings = AndroidInitializationSettings('mipmap/ic_launcher');
    Notifications notifications = Notifications();
    notifications.init();
    notifications.setupInteractedMessage();
    notifications.setForegroundMessaging();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InsulinMeasurementBloc(InitialInsulinMeasurementState()),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SelectedHorseProvider(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const WelcomePage(),
        ),
      ),
    );
  }
}
