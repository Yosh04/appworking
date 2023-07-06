import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/generador.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

//Paquetes de starlin.

import 'package:open_file/open_file.dart'; // Importa la biblioteca open_file

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _pickDirectory();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFF1C207F),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(
                20), // Ajusta el valor de acuerdo a tus preferencias
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 60,
              color: Colors.grey,
              child: const Center(
                child: Text(
                  'Documentos Recientes',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 550, // Ajusta la altura según tus preferencias
              child: ListView.separated(
                physics:
                    const ClampingScrollPhysics(), // Habilita el desplazamiento vertical en el ListView
                shrinkWrap: true,
                itemCount: files.length,
                itemBuilder: (context, index) {
                  String fileName = basename(files[index].path);
                  return ElevatedButton(
                    onPressed: () {
                      _pickFile(files[index].path);
                    },
                    child: Container(
                      height: 60,
                      child: Row(
                        children: [
                          const Icon(Icons.picture_as_pdf,
                              color: Colors.red, size: 50),
                          Flexible(
                            child: Text(
                              fileName,
                              style: const TextStyle(fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Color(0xFFF1F4F8),
        child: Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: _createFile,
                icon: Icon(
                  Icons.add_circle_outline_outlined,
                  color: Color(0xFF1C207F),
                  size: 38,
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.upload_file_outlined,
                  color: Color(0xFF1C207F),
                  size: 38,
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.settings,
                  color: Color(0xFF1C207F),
                  size: 38,
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.exit_to_app,
                  color: Color(0xFF1C207F),
                  size: 38,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickFile(String filePath) async {
    OpenFile.open(filePath); // Abre el archivo usando la ruta proporcionada
  }

  //final String _filePath = '/data/user/0/com.example.untitled/app_flutter/';
  List<FileSystemEntity> files = [];
  Directory appDocumentsDirectory = Directory('/storage/emulated/0/books');

  void _createFile() async {
    var statusPermission = await Permission.manageExternalStorage.request();

    print(appDocumentsDirectory);
    if (statusPermission.isGranted) {
      print(statusPermission);
      generatePDFAndOpen(appDocumentsDirectory);
      timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
        listarArchivosRecursivos(appDocumentsDirectory);
        timer?.cancel();
      });
    } else {
      print(statusPermission);
    }
  }

  void _pickDirectory() async {
    var statusPermission = await Permission.manageExternalStorage.request();
    Directory appDocumentsDirectory = Directory('/storage/emulated/0/books');
    if (statusPermission.isGranted) {
      print('Permitido amigo mio.');
      print(statusPermission);
      listarArchivosRecursivos(appDocumentsDirectory);
      timer = Timer.periodic(const Duration(seconds: 20), (Timer t) {
        listarArchivosRecursivos(appDocumentsDirectory);
      });
    } else {
      print('Denegado amigo mio.');
      print(statusPermission);
    }
  }

  Future<void> listarArchivosRecursivos(Directory directorio) async {
    files = directorio
        .listSync(recursive: true)
        .where((e) => e is File && e.path.endsWith('.pdf'))
        .toList();
    print(files);
    print(await directorio.exists());
    String absolutePath = directorio.absolute.path;
    bool isDirectoryEmpty = directorio.listSync().isEmpty;
    print(isDirectoryEmpty);

    print(absolutePath);

    if (files.isNotEmpty) {
      setState(() {
        //_fileText = fileNames; // Actualizar el widget de tipo Text
      });
    } else {
      setState(() {
        //_fileText = 'No hay archivos en la ruta especificada.';
      });
    }
  }
}
