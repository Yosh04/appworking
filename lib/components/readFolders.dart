import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Timer? timer;

Future<List<FileSystemEntity> > pickDirectory(Directory appDocumentsDirectory) async {
  final externalDir = await getExternalStorageDirectory();
  if (externalDir != null) {
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

Future<List<FileSystemEntity> > listFilesDirectory(Directory directorio) async {
  List<FileSystemEntity> files = [];
  files = directorio
      .listSync(recursive: true)
      .where((e) => e is File && e.path.endsWith('.pdf'))
      .toList();
  print(files);
  return files;
}