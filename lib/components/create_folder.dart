import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

void createfolder() async {
  var statusPermission = await Permission.manageExternalStorage.request();
  print(statusPermission);
  if (statusPermission.isGranted) {
    final newfolder =
        Directory('/storage/emulated/0/formularios de inspeccion');
    if (await newfolder.exists()) {
      print('La carpeta ya existe: ${newfolder.path}');
    } else {
      newfolder.create(recursive: true).then((Directory carpeta) {
        print('Carpeta creada: ${carpeta.path}');
      }).catchError((error) {
        print('Error al crear la carpeta: $error');
      });
    }
  } else {
    print('Denegado amigo mio. pne');
    print(statusPermission);
  }
}

void pruebadirec() async {
  String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
  print(selectedDirectory);
}
