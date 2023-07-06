import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/generador.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
//Pachage widgets home
import 'widgets home/bottomNavigationBar.dart';
//Package components
import 'components/create_folder.dart';
import 'components/selectFile.dart';
import 'components/readFolders.dart';

import 'package:open_file/open_file.dart'; // Importa la biblioteca open_file

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<FileSystemEntity> files = [];
  Directory appDocumentsDirectory = Directory(
      '/storage/emulated/0/Android/data/com.example.untitled/files/formularios de inspeccion');

  @override
  void initState() {
    super.initState();
    createFolder();
    pickDirectory(appDocumentsDirectory).then((fileList) {
      setState(() {
        files = fileList;
      });
    });
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
        title: const Text('Guardacostas'),
        backgroundColor: const Color(0xFF1C207F),
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
              color: Colors.white,
              child: const Center(
                child: Text(
                  'Documentos Recientes',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF1C207F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.black12,
              height: 450, // Ajusta la altura según tus preferencias
              child: ListView.separated(
                physics:
                    const ClampingScrollPhysics(), // Habilita el desplazamiento vertical en el ListView
                shrinkWrap: true,
                itemCount: files.length,
                itemBuilder: (context, index) {
                  String fileName = basename(files[index].path);
                  return ElevatedButton(
                    onPressed: () {
                      pickFile(files[index].path);
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
      bottomNavigationBar: CustomBottomNavigationBar(
        onAddPressed:
            _createFile, // Reemplaza _createFile con la función que deseas llamar al presionar el botón de agregar
      ),
    );
  }

  //Important Code.

  void _createFile() async {
    var statusPermission = await Permission.manageExternalStorage.request();
    final externalDir = await getExternalStorageDirectory();
    print(appDocumentsDirectory);
    if (externalDir != null) {
      print(statusPermission);
      generatePDFAndOpen(appDocumentsDirectory);
      timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
        listFilesDirectory(appDocumentsDirectory);
        timer?.cancel();
      });
    } else {
      print(statusPermission);
    }
  }
}
