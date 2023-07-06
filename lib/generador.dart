import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:open_file/open_file.dart'; // Importa la biblioteca open_file

Future<void> generatePDF(Directory appDocumentsDirectory) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Table.fromTextArray(
          context: context,
          data: <List<String>>[
            <String>['Código', 'Módulo'],
            <String>['RF-MU', 'Módulo Usuario'],
            <String>['RF-ME', 'Módulo Embarcación'],
            <String>['RF-MT', 'Módulo Tripulación'],
            <String>['RF-MI', 'Módulo Incidente'],
            <String>['RF-MP', 'Módulo Propietario'],
            <String>['RF-MM', 'Módulo Motor'],
            <String>['RF-MIN', 'Módulo Inspección'],
            <String>['RF-MPV', 'Módulo Previsualización'],
          ],
        );
      },
    ),
  );

  final filePath = '${appDocumentsDirectory.path}/module_table.pdf'; // Ruta completa del archivo PDF

  final file = File(filePath);
  await file.writeAsBytes(await pdf.save());

  // Abre el archivo PDF después de generarlo
}

void generatePDFAndOpen(Directory appDocumentsDirectory) async {
  await generatePDF(appDocumentsDirectory);
  print('PDF generado exitosamente.');
}
