import 'package:fit_life/controller/atividade_controller.dart';
import 'package:fit_life/view/pages/atividades_concluidas.dart';
import 'package:fit_life/view/pages/atividades_pendentes.dart';
import 'package:fit_life/view/pages/config_view.dart';
import 'package:fit_life/view/pages/dashboard_view.dart';
import 'package:fit_life/view/pages/tela_inicio_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AtividadeController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // O Provider observa o controller aqui
    final controller = context.watch<AtividadeController>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitLife',
      // Define as cores do tema claro
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      // Define as cores do tema escuro
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      // Aqui está a mágica: ele escolhe qual tema usar baseado no Controller
      themeMode: controller.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      initialRoute: "/",
      routes: {
        "/": (context) => const TelainicioView(),
        "/ativMenu": (context) => const AtividadesPendentes(),
        "/concluidas": (context) => const AtividadesConcluidasView(),
        "/dashboard": (context) => const DashboardView(),
        "/config": (context) => const ConfiguracoesView(),
      },
    );
  }
}