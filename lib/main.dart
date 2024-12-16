import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import for Firebase Authentication
import 'firebase_options.dart'; // Generated Firebase configuration file
import 'package:flutter/services.dart'; // For customizing system UI
import 'pages/WelcomeScreen.dart'; // Import WelcomeScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with options for the current platform
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set the system UI overlay style (e.g., transparent status bar)
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  // Entry point of the Flutter app
  runApp(const MyApp());
}

// MyApp is the root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Auth Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WelcomeScreen(), // Set WelcomeScreen as the initial screen
    );
  }
}
