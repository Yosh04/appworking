import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/generador.dart';
import 'package:permission_handler/permission_handler.dart';
//Pachage widgets home
import 'widgets home/bottomNavigationBar.dart';
import 'widgets home/pdfviews.dart';
//Package components
import 'components/create_folder.dart';
import 'components/readFolders.dart';

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
              height: 50,
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
            pdfView(files), //widget de pdf
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
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
      pickDirectory(appDocumentsDirectory).then((fileList) {
        setState(() {
          files = fileList;
        });
      });
    } else {
      print(statusPermission);
    }
  }
}
