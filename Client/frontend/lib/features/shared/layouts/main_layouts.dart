import 'package:flutter/material.dart';
import '../../../shared/widgets/app_bottom_nav.dart';

class MainLayouts extends StatelessWidget {
  final Widget child;

  const MainLayouts({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NisitTrade')),
      body: child,
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}