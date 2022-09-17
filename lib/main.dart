import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:kasamotta/di/providers.dart';
import 'package:kasamotta/firebase_options.dart';
import 'package:kasamotta/view/screens/home_screen.dart';
import 'package:kasamotta/view/screens/login_screen.dart';
import 'package:kasamotta/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String token = await messaging.getToken() ?? "no token";
  print("fcmToken:"+token);
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');
  runApp(
    MultiProvider(
      providers: globalProviders,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginViewModel>();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: loginViewModel.isSignIn(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
