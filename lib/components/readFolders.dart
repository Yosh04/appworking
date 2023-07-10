import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


///Timer para llevar el tiempo de actulización cada cierta cantidad de tiempo.
Timer? timer;

///Selecciona de forma automatica un directorio interno y precarga la ruta para un sistema de filtrado
Future<List<FileSystemEntity> > pickDirectory(Directory appDocumentsDirectory) async {
  final externalDir = await getExternalStorageDirectory();
  if (externalDir != null) {  ///Verificación de carptetas para que no sean nulas.
    print('Permitido amigo mio.');
    listFilesDirectory(appDocumentsDirectory);
    timer = Timer.periodic(const Duration(seconds: 20), (Timer t) {
      listFilesDirectory(appDocumentsDirectory);
    });
  } else {
    print('Denegado amigo mio.');
  }
  return listFilesDirectory(appDocumentsDirectory);
}


///Sistema de filtrado para los directorios acotados para PDF.
Future<List<FileSystemEntity> > listFilesDirectory(Directory directorio) async {
  List<FileSystemEntity> files = [];
  files = directorio
      .listSync(recursive: true)
      .where((e) => e is File && e.path.endsWith('.pdf'))
      .toList();
  print(files);
  return files;
}