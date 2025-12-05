import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// Import your app modules
import 'package:budget_tracker_app/budget_tracker_app.dart';
import 'package:budget_tracker_app/core/routing/routing.dart';
import 'package:budget_tracker_app/firebase_options.dart';

Future<void> main() async {
  // Ensures Flutter engine is initialized before Firebase
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Firebase with platform-specific options
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Run the main app
    runApp(BudgetTrackerApp(routing: Routing.instance));
  } catch (e, stackTrace) {
    // Log initialization errors
    debugPrint('Firebase initialization failed: $e');
    debugPrintStack(stackTrace: stackTrace);

    // Optionally, show a fallback error UI
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text(
              'Something went wrong while starting the app.',
              style: TextStyle(fontSize: 16, color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
