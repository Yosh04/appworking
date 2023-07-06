import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


List<FileSystemEntity> files = [];
Directory appDocumentsDirectory = Directory(
    '/storage/emulated/0/Android/data/com.example.untitled/files/formularios de inspeccion');
Timer? timer;

void pickDirectory() async {
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
}

Future<void> listFilesDirectory(Directory directorio) async {
  files = directorio
      .listSync(recursive: true)
      .where((e) => e is File && e.path.endsWith('.pdf'))
      .toList();
  print(files);
}