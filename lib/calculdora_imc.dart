import 'dart:io';

import 'package:calculdora_imc/classes/Pessoa.dart';

  String? nome;
  double? peso;
  double? altura;

void execute() {
  print("------- CALCULADORA IMC -------");
  print("IMC ----------- CLASSIFICAÇÃO--");
  print("< 16 --------- Magreza grave --");
  print("16 a 17 ------ Magreza moderada");
  print("17 a 18.5 ---- Magreza leve----");
  print("18.5 a 25 ---- Saudável -------");
  print("25 a 30 ------ Sobrepeso ------");
  print("30 a 35 ------ Obesidade Grau 1");
  print("35 a 40 ------ Obesidade Grau 2");
  print(">= 40 -------- Obesidade Grau 3");
  print("-------------------------------");
  obterDadosUsuario();
  
  Pessoa pessoa = Pessoa(nome!, peso, altura);
  bool dadosCorretos = false;
  do {
  
  pessoa = Pessoa(nome!, peso, altura);
  print("Dados da pessoa:");
  print("Nome: ${pessoa.getNome()}");
  print("Peso: ${pessoa.getPeso()}");
  print("Altura: ${pessoa.getAltura()}");
  print("Confirma as informações? [S/N]");
  String? confirmacao = stdin.readLineSync()?.toUpperCase();
  if (confirmacao == 'S' || confirmacao == 's') {
      dadosCorretos = true;
    } else if (confirmacao == 'N' || confirmacao == 'n') {
      print("Por favor, redigite os dados.");
      obterDadosUsuario();
    } else {
      print("Resposta inválida!");
    }
  } while (!dadosCorretos);
  calculaIMC(pessoa);
}

void obterDadosUsuario() {
  print("Informe seu nome: ");
  String? nomeLocal = stdin.readLineSync();
  if (nomeLocal == null || nomeLocal.isEmpty) {
    nomeLocal = "Usuário Padrão";
    print("Nome inválido. Foi definido como: $nomeLocal");
  }
  double? pesoLocal;
  do {
    try {
      print("Informe seu peso: ");
      pesoLocal = double.parse(stdin.readLineSync()!);
      if (pesoLocal.isNaN) {
        pesoLocal = null;
      }
    } catch (e) {
      print("Por favor, digite um valor numérico válido para o peso!");
    }
  } while (pesoLocal == null);

  nome = nomeLocal;
  peso = pesoLocal;

  double? alturaLocal;
  do {
    try {
      print("Informe sua altura: ");
      alturaLocal = double.parse(stdin.readLineSync()!);
      if (alturaLocal > 100) {
        alturaLocal /= 100;
      }
      if (alturaLocal.isNaN) {
        alturaLocal = null;
      }
    } catch (e) {
      print("Por favor, digite um valor numérico válido para a altura!");
    }
  } while (alturaLocal == null);

  altura = alturaLocal;
}

void calculaIMC(Pessoa pessoa) {
  var peso = pessoa.getPeso();
  var altura = pessoa.getAltura();
  var nome = pessoa.getNome();
  double imc = peso! / (altura! * altura);
  imc = double.parse(imc.toStringAsFixed(2));
  print(imc);
   if (imc < 16) {
    print("Olá $nome, sua classificação é: Magreza grave");
  } else if (imc < 17) {
    print("Olá $nome, sua classificação é: Magreza moderada");
  } else if (imc < 18.5) {
    print("Olá $nome, sua classificação é: Magreza leve");
  } else if (imc < 25) {
    print("Olá $nome, sua classificação é: Saudável");
  } else if (imc < 30) {
    print("Olá $nome, sua classificação é: Sobrepeso");
  } else if (imc < 35) {
    print("Olá $nome, sua classificação é: Obesidade Grau 1");
  } else if (imc < 40) {
    print("Olá $nome, sua classificação é: Obesidade Grau 2 (severa)");
  } else {
    print("Olá $nome, sua classificação é: Obesidade Grau 3 (mórbida)");
  }
}