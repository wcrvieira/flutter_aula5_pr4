import 'package:flutter/material.dart';

class CalculadoraIMC extends StatefulWidget {
  const CalculadoraIMC({super.key});

  @override
  State<CalculadoraIMC> createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  TextEditingController controlaPeso = TextEditingController();
  TextEditingController controlaAltura = TextEditingController();
  String resultado = '';
  String classificacao = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: const Text("Calculadora IMC"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Informe os dados abaixo'),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: controlaPeso,
                  decoration: const InputDecoration(
                    labelText: 'Peso',
                    hintText: 'Digite o seu peso',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: controlaAltura,
                  decoration: const InputDecoration(
                    labelText: 'Altura',
                    hintText: 'Digite a sua altura',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Text(
                      resultado,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      classificacao,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            num aux = (num.parse(controlaPeso.text) /
                                (num.parse(controlaAltura.text) *
                                    num.parse(controlaAltura.text)));
                            resultado = "Seu IMC é ${aux.toStringAsFixed(2)}";

                            if (aux >= 40) {
                              classificacao = "Classificação: Obesidade mórbida III";
                            }
                            else if (aux >= 35) {
                              classificacao = "Classificação: Obesidade mórbida II";
                            }
                            else if (aux >= 30) {
                              classificacao = "Classificação: Obesidade mórbida I";
                            }
                             else if (aux >= 25) {
                              classificacao = "Classificação: Sobrepeso";
                            }
                             else if (aux >= 18.5) {
                              classificacao = "Classificação: Peso ideal";
                            }
                             else if (aux >= 17) {
                              classificacao = "Classificação: Abaixo do peso";
                            }
                            else {
                              classificacao = "Classificação: Muito abaixo do peso";
                            }
                          });
                        },
                        child: const Text('Calcular')),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            controlaPeso.clear();
                            controlaAltura.clear();
                            resultado = '';
                            classificacao = '';
                          });
                        },
                        child: const Text('Limpar')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
