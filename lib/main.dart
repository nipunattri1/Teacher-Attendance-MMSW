import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:teacher_attendance/firebase_options.dart';
import 'package:teacher_attendance/static/theme/theme_json.dart';
import 'package:teacher_attendance/views/base_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MMSW Attendance',
      debugShowCheckedModeBanner: false,
      theme: themeData.copyWith(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
          ),
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      home: const BaseView(),
    );
  }
}
