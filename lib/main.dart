import 'package:arfudy_flutter/controllers/ar_view_controller.dart';
import 'package:arfudy_flutter/utils/ui_theme.dart';
import 'package:arfudy_flutter/views/ar_view.dart';
import 'package:arfudy_flutter/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ArViewController(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: UITheme.lightTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeView(),
          'ar_page': (context) => const ArView(),
        },
      ),
    );
  }
}
