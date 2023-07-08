import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart' as pwg;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:untitled/generador.dart';
import 'package:permission_handler/permission_handler.dart';

// Package widgets home
import 'widgets home/bottomNavigationBar.dart';
import 'widgets home/pdfviews.dart';

// Package components
import 'components/create_folder.dart';
import 'components/readFolders.dart';
import 'models/InspectionFormModel.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => InspectionFormModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Uint8List? signatureImage;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Guardacostas'),
        backgroundColor: const Color(0xFF1C207F),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
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
            pdfView(files),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Future<void> saveSignatureAsPdf(Uint8List signatureImage) async {
    Directory appDocumentsDirectoryIMGPDF = Directory(
        '/storage/emulated/0/books');

    final pdf = pw.Document();

    final signatureImageWidget = pw.MemoryImage(signatureImage);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pwg.Image(signatureImageWidget);
        },
      ),
    );
    final outputFile = File('${appDocumentsDirectoryIMGPDF.path}/signature.pdf');
    await outputFile.writeAsBytes(await pdf.save());
  }



  /*
  void _createFile() async {
    var statusPermission = await Permission.manageExternalStorage.request();
    final externalDir = await getExternalStorageDirectory();
    print(appDocumentsDirectory);
    if (externalDir != null) {
      //print(statusPermission);
      //generatePDFAndOpen(appDocumentsDirectory);
      pickDirectory(appDocumentsDirectory).then((fileList) {
        setState(() {
          files = fileList;
        });
      });
    } else {
      print(statusPermission);
    }
  }

  */
}
