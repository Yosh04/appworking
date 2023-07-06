
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path/path.dart';

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
  String _fileText = '';

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
            ElevatedButton(onPressed: _pickFile, child: Text('Pick file')),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _LoadAllFilesList,
              child: Text('Load Documents'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _pickDirectory,
              child: Text('Select the files'),
            ),
            SizedBox(height: 10),

            Text(_fileText),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: files.length,
              itemBuilder: (context, index) {
                String fileName = basename(files[index].path);
                return ElevatedButton(
                  onPressed: () {
                    OpenFile.open(_filePath + basename(files[index].path));
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

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      /// Load result and file details
      File _file = File(result.files.single.path!);
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
      setState(() {
        _fileText = _file.path;
      });

      // Abre el archivo PDF después de generarlo
      OpenFile.open(_file.path);
    } else {
      // User canceled the picker
    }
  }

  final String _filePath = '/data/user/0/com.example.untitled/cache/file_picker/';
  List<FileSystemEntity> files =[];

  void _LoadAllFilesList() {
    Directory directory = Directory(_filePath);
    files = directory.listSync();
    print(files);
    if (files.isNotEmpty) {
      String fileNames = '';
      for (var file in files) {
        if (file is File) {
          fileNames += basename(file.path) + '\n';
        }
      }
      setState(() {
        _fileText = fileNames; // Actualizar el widget de tipo Text
      });
    } else {
      setState(() {
        _fileText = 'No hay archivos en la ruta especificada.';
      });
    }
  }

  void _pickDirectory() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    if (selectedDirectory != null) {
      setState(() {
        _fileText = selectedDirectory;
      });
    } else {
// User canceled the picker
    }
  }

  void _listPath() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    Directory directory = Directory(_filePath);
    files = directory.listSync();
    print(files);

    if (selectedDirectory != null) {
      setState(() {
        _fileText = selectedDirectory;
      });
    } else {
// User canceled the picker
    }
  }


}