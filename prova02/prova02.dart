import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TesouroGame(),
  ));
}

class TesouroGame extends StatefulWidget {
  @override
  _TesouroGameState createState() => _TesouroGameState();
}

class _TesouroGameState extends State<TesouroGame> {
  final Random random = Random();
  int? tesouro;
  int? bomba;
  int? pirata;
  String mensagem = 'Clique em um número para encontrar o tesouro!';
  List<bool> botoesHabilitados = List.filled(20, true);
  bool fimDeJogo = false;

  @override
  void initState() {
    super.initState();
    iniciarJogo();
  }

  void iniciarJogo() {
    setState(() {
      tesouro = random.nextInt(20) + 1;
      do {
        bomba = random.nextInt(20) + 1;
      } while (bomba == tesouro);
      do {
        pirata = random.nextInt(20) + 1;
      } while (pirata == tesouro || pirata == bomba);

      mensagem = 'Clique em um número para encontrar o tesouro!';
      botoesHabilitados = List.filled(20, true);
      fimDeJogo = false;
    });
  }

  void verificarEscolha(int numero) {
    if (fimDeJogo || !botoesHabilitados[numero - 1]) return;

    setState(() {
      if (numero == tesouro) {
        mensagem = '🏆 Você encontrou o tesouro!';
        fimDeJogo = true;
        botoesHabilitados = List.filled(20, false);
      } else if (numero == bomba) {
        mensagem = '💣 Você encontrou uma bomba! Game over.';
        fimDeJogo = true;
        botoesHabilitados = List.filled(20, false);
      } else if (numero == pirata) {
        mensagem = '☠️ Você encontrou o pirata! Fim de jogo.';
        fimDeJogo = true;
        botoesHabilitados = List.filled(20, false);
      } else {
        botoesHabilitados[numero - 1] = false;
        mensagem = numero < tesouro!
            ? 'O tesouro está em um número MAIOR.'
            : 'O tesouro está em um número MENOR.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CAÇA AO TESOURO'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Container(
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  mensagem,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: List.generate(20, (index) {
                    return ElevatedButton(
                      onPressed: botoesHabilitados[index]
                          ? () => verificarEscolha(index + 1)
                          : null,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.yellow
                      ),
                      child: Text('${index + 1}'),
                    );
                  }),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: iniciarJogo,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
                    child: Text('🔁 Jogar novamente'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
