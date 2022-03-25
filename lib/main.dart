import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'screens/search_results_screen.dart';
import 'screens/browse_screen.dart';
import 'screens/launch_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/login_screen.dart';
import 'screens/search_screen.dart';
import 'screens/library_screen.dart';
import 'utils/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
          title: 'Spotify Clone',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Raleway',
            brightness: Brightness.dark,
            primaryColor: Colors.grey.shade400,
          ),
          home: const AuthWrapper(),
          routes: {
            LaunchScreen.id: (context) => const LaunchScreen(),
            RegistrationScreen.id: (context) => const RegistrationScreen(),
            LoginScreen.id: (context) => const LoginScreen(),
            BrowseScreen.id: (context) => const BrowseScreen(),
            SearchScreen.id: (context) => const SearchScreen(),
            LibraryScreen.id: (context) => const LibraryScreen(),
            SearchResultsScreen.id: (context) => const SearchResultsScreen(),
          }),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const BrowseScreen();
    }
    return const LaunchScreen();
  }
}
