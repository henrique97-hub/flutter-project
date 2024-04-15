import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/home_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeController homeController = HomeController();
  int _counter = 0;
  late List<Map<String, dynamic>> _apiResponse = [];

  void _callApi() async {
    final response = await homeController.chamarApi(
        categoria: "nome_unidade", descricao: "Vila Mariana");
    setState(() {
      _apiResponse = response ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: _callApi,
              child: Text('Call API'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _apiResponse.length,
                itemBuilder: (context, index) {
                  final item = _apiResponse[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow, width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Equipamento: ${item['equipamento']}'),
                        Text(
                            'Código do Equipamento: ${item['codigo_equipamento']}'),
                        Text('MAC Address: ${item['mac_address']}'),
                        Text('Nome do Setor: ${item['nome_setor']}'),
                        Text('Nome da Unidade: ${item['nome_unidade']}'),
                        Text(
                            'Campos Adicionais Placa: ${item['campos_adicionais_placa']}'),
                        Text('ID: ${item['id']}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
