import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/main_dashboard_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // تثبيت اتجاه الشاشة بشكل عمودي لتصميم منظم
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const LifePilotApp());
}

class LifePilotApp extends StatelessWidget {
  const LifePilotApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifePilot OS',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A), // لون خلفية عصري (Slate 900)
        primaryColor: const Color(0xFF6366F1), // لون أساسي (Indigo)
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6366F1),
          secondary: Color(0xFFEC4899), // لون فرعي (Pink)
          surface: Color(0xFF1E293B), // لون البطاقات (Slate 800)
        ),
        fontFamily: 'Inter',
      ),
      home: const MainDashboardScreen(),
    );
  }
}
