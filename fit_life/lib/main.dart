import 'package:fit_life/controller/atividade_controller.dart';
import 'package:fit_life/view/pages/atividades_concluidas.dart';
import 'package:fit_life/view/pages/atividades_pendentes.dart';
import 'package:fit_life/view/pages/tela_inicio_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args){
  runApp(ChangeNotifierProvider(
    create: (context) => AtividadeController(),
    child: MaterialApp(
      routes: {
        "/": (context) => TelainicioView(),
        "/ativMenu": (context) => AtividadesPendentes(),
        "/concluidas": (context) => AtividadesConcluidasView(),
      },
      initialRoute: "/",
    ),
  ));
}