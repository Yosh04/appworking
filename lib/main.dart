
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/generador.dart';
import 'package:permission_handler/permission_handler.dart';


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _pickDirectory, child: Text('LIST DIRECTORY FILES')),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _pickDirectoryExter, child: Text('CREATE PFD')),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: files.length,
              itemBuilder: (context, index) {
                String fileName = basename(files[index].path);
                return ElevatedButton(
                  onPressed: () {
                    _pickFile(files[index].path);
                  },
                  child: Text(fileName),
                );
              },
            ),
          ],
        ),
      ),

    );
  }




  void _pickFile(String filePath) async {
    OpenFile.open(filePath); // Abre el archivo usando la ruta proporcionada
  }

  //final String _filePath = '/data/user/0/com.example.untitled/app_flutter/';
  List<FileSystemEntity> files =[];
  Directory appDocumentsDirectory = Directory('/storage/emulated/0/books');

  void _pickDirectoryExter() async {




    var statusWR = await Permission.manageExternalStorage.request();

    print(appDocumentsDirectory);

    if (statusWR.isGranted) {
      print(statusWR);
      //listarArchivosRecursivos(appDocumentsDirectory);
      generatePDFAndOpen(appDocumentsDirectory);
    } else {
      print(statusWR);
    }


  }

  Future<void> requestStoragePermission() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {

    } else {

    }
  }

  void _pickDirectory() async {
    //Directory appDocumentsDirectory = Directory('/storage/emulated/0/books');
    Directory appDocumentsDirectory = Directory('/storage/emulated/0/books');
    await requestStoragePermission(); // Esperar la ejecución de requestStoragePermission()


    var statusWR = await Permission.manageExternalStorage.request();

    print(appDocumentsDirectory);

    if (statusWR.isGranted) {
      print(statusWR);
      listarArchivosRecursivos(appDocumentsDirectory);
      generatePDFAndOpen(appDocumentsDirectory);
    } else {
      print(statusWR);
    }

  }


  Future<void> listarArchivosRecursivos(Directory directorio) async {
    files = directorio.listSync(recursive: true).where((e) => e is File && e.path.endsWith('.pdf')).toList();
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