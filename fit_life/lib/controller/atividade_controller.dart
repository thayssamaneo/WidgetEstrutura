import 'package:fit_life/model/atividade.dart';
import 'package:flutter/material.dart';

class AtividadeController extends ChangeNotifier{
  final List<Atividade> _atividadesPendentes = [];
  final List<Atividade> _atividadesConcluidas = [];

  List<Atividade> get atividades => _atividadesPendentes;

  // métodos 

  // criar nova atividade
  void createAtividade(String titulo){
    if (titulo.trim().isEmpty)return; // validação se a tarefa possui nome, se não, interrompe

    _atividadesPendentes.add(Atividade(titulo: titulo)); // adicionando uma nova atividade no vetor

    notifyListeners();
  }

  // atualizando/marcando como concluida
  void updateAtividade(int index, String titulo){
        _atividadesPendentes[index].concluida = !_atividadesPendentes[index].concluida;
        // "!" -> Inverte o valor da booleana

        _atividadesConcluidas.add(Atividade(titulo: titulo));
        _atividadesPendentes.removeAt(index);

        notifyListeners();

    }

    // deletando uma tarefa
    void excluirAtividade(int index){
      _atividadesConcluidas.removeAt(index);
      notifyListeners();
    }

    // métricas de saúde

    // total tarefas pendentes
    int get totalAtivPend => _atividadesPendentes.length;

    int get totalAtivConcl => _atividadesConcluidas.length;
}