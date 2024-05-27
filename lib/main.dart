import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/auth/signup_auth_provider.dart';
import 'package:smart_home/auth/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/firebase_options.dart';
import 'package:smart_home/screen/login_screen.dart';

// import 'home_page.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<SignupAuthProvider>(
          create: (context) => SignupAuthProvider(),
        ),
        // ChangeNotifierProvider<SignupAuthProviderAtheleticsCoach>(
        //   create: (context) => SignupAuthProviderAtheleticsCoach(),
        // ),
        // ChangeNotifierProvider<SignupAuthProviderFitnessCoach>(
        //   create: (context) => SignupAuthProviderFitnessCoach(),
        // ),
        // ChangeNotifierProvider<SignupAuthProviderAtheletAccount>(
        //   create: (context) => SignupAuthProviderAtheletAccount(),
        // ),
      ],
      child: const SmartHomeApp(),
    ),
  );
}

class SmartHomeApp extends StatelessWidget {
  const SmartHomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Smart-Home',
          theme:
              themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          initialRoute: '/',
          routes: {
            '/': (context) => Login(
                  onTap: () {
                    // Handle the onTap event here if needed
                  },
                ),
            // '/settings': (context) => const SettingsPage(),
          },
        );
      },
    );
  }
}
