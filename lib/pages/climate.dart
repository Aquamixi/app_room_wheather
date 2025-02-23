import 'package:flutter/material.dart';
import 'fetch_data.dart';
import 'package:myroomwheather/Obj/request.dart';

class CurrWheather extends StatefulWidget {
  const CurrWheather({super.key});

  @override
  State<CurrWheather> createState() => _CurrWheatherState();
}

class _CurrWheatherState extends State<CurrWheather> {
  late Future<Request> futureRequest;

  @override
  void initState() {
    super.initState();
    futureRequest = fetchRequest();
  }

  void reloadTemp() {
    setState(() {
      futureRequest = fetchRequest(); // Atualiza o Future para refazer a requisição
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temperatura do ambiente"),
        backgroundColor: Colors.blue.shade400,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: reloadTemp, // Chama a função de atualização ao clicar no botão
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade200, // Light blue for the sky
              Colors.grey.shade300, // Light grey for clouds
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder<Request>(
          future: futureRequest,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error}', style: TextStyle(color: Colors.white)));
            } else if (snapshot.hasData) {
              return Center(
                child: Text(
                  "${snapshot.data!.temperature} °C",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              );
            }
            return const Center(child: Text("Sem dados", style: TextStyle(color: Colors.white)));
          },
        ),
      ),
    );
  }
}
