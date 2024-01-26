import 'package:clc/Provider/User_provider.dart';
import 'package:clc/Services/auth_Services.dart';
import 'package:clc/routes/routes.dart';
import 'package:clc/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthService _auth = AuthService();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await _auth.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      initialRoute: Routes.homePage,
      routes: Routes.route,
    );
  }
}
