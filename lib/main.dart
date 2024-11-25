import 'package:flutter/material.dart';
import './widgets/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class DefaultTheme {
  ThemeData themeData = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color.fromRGBO(234, 221, 255, 1),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(34, 0, 93, 1)),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll<OutlinedBorder?>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0)
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          side: WidgetStatePropertyAll(
            BorderSide(color: Color.fromRGBO(34, 0, 93, 1)),
          ),
          foregroundColor: WidgetStatePropertyAll(Color.fromRGBO(34, 0, 93, 1)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              fontWeight: FontWeight.bold, // задає товщину шрифту
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          side: WidgetStatePropertyAll(
            BorderSide(color: Color.fromRGBO(34, 0, 93, 1)),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              fontWeight: FontWeight.bold, // задає товщину шрифту
            ),
          ),
        ),

      ),
      textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 25, color: Color.fromRGBO(103, 80, 164, 1), fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(103, 80, 164, 1))
      ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DefaultTheme().themeData,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DefaultTheme().themeData,
      home: SignInScreen(),
    );
  }
}

