import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sntr_banking_management_agent_end/controller_binder.dart';
import 'package:sntr_banking_management_agent_end/view/screen/splash_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinder(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      title: "SNTR Mobile Banking Agent End",
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            border: _outlineInputBorder,
            focusedBorder: _outlineInputBorder,
            enabledBorder: _outlineInputBorder,
            errorBorder: _outlineInputBorder.copyWith(
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
          )
      ),
    );
  }
  final OutlineInputBorder _outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 2),
  );
}
