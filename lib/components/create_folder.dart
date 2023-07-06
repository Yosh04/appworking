import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dart:io';
import 'package:path_provider/path_provider.dart';

void createFolder() async {
  final externalDir = await getExternalStorageDirectory();

  if (externalDir != null) {
    final newFolder =
        Directory('${externalDir.path}/formularios de inspeccion');

    if (await newFolder.exists()) {
      print('La carpeta ya existe: ${newFolder.path}');
    } else {
      try {
        await newFolder.create(recursive: true);
        print('Carpeta creada: ${newFolder.path}');
      } catch (e) {
        print('Error al crear la carpeta: $e');
      }
    }
  } else {
    print('No se pudo acceder al almacenamiento externo');
  }
}

void pruebadirec() async {
  String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
  print(selectedDirectory);
}
