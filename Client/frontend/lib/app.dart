import 'package:flutter/material.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/route_controller.dart';

class NisitTradeApp extends StatelessWidget {
  const NisitTradeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: controlRoute,
    );
  }
}
