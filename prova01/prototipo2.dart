//Calculadora IMC

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      debugShowCheckedModeBanner: false, // 
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: CalculadoraIMC(),
    );
  }
}

class CalculadoraIMC extends StatefulWidget {
  @override
  _CalculadoraIMCState createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  String resultado = "";
  String classificacao = "";

  void calcularIMC() {
    double peso = double.tryParse(pesoController.text) ?? 0;
    double altura = double.tryParse(alturaController.text) ?? 0;

    if (peso <= 0 || altura <= 0) {
      setState(() {
        resultado = "⚠️ Por favor, insira valores válidos.";
        classificacao = "";
      });
      return;
    }

    double imc = peso / (altura * altura);
    String imcFormatado = imc.toStringAsFixed(2);

    String classificacaoTexto;
    String emoji;

    if (imc < 18.5) {
      classificacaoTexto = "Abaixo do peso";
      emoji = "🪶";
    } else if (imc <= 24.9) {
      classificacaoTexto = "Peso normal";
      emoji = "💪";
    } else if (imc <= 29.9) {
      classificacaoTexto = "Sobrepeso";
      emoji = "🍔";
    } else if (imc <= 34.9) {
      classificacaoTexto = "Obesidade grau I";
      emoji = "⚠️";
    } else if (imc <= 39.9) {
      classificacaoTexto = "Obesidade grau II";
      emoji = "🚨";
    } else {
      classificacaoTexto = "Obesidade grau III";
      emoji = "❗";
    }

    setState(() {
      resultado = "Seu IMC é: $imcFormatado";
      classificacao = "$emoji Classificação: $classificacaoTexto";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculadora de IMC',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal.shade100,
        elevation: 4,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/1048/1048953.png',
                height: 80,
              ),
              SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: pesoController,
                        decoration: InputDecoration(
                          labelText: 'Peso (kg)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: alturaController,
                        decoration: InputDecoration(
                          labelText: 'Altura (m)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: calcularIMC,
                icon: Icon(Icons.favorite, color: Colors.white),
                label: Text('Calcular IMC', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  elevation: 4,
                ),
              ),
              SizedBox(height: 24),
              Text(
                resultado,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              Text(
                classificacao,
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
