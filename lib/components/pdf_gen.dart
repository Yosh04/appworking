import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';

class PdfGenerator {
  /// Cargar las imágenes desde los archivos
  Uint8List img1 = Uint8List(0);
  Uint8List img2 = Uint8List(0);
  Future<void> loadImages() async {
    final ByteData bytes = await rootBundle.load('assets/Msp_logo.jpg');
    img1 = bytes.buffer.asUint8List();
    final ByteData bytes1 = await rootBundle.load('assets/gc_logo.png');
    img2 = bytes1.buffer.asUint8List();
  }

  /// Construir el encabezado del documento
  pw.Widget buildHeader() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Image(pw.MemoryImage(img1),
                fit: pw.BoxFit.fitHeight, height: 50, width: 50),
            pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text(
                  'SERVICIO NACIONAL DE GUARDACOSTAS',
                  style: const pw.TextStyle(fontSize: 11),
                ),
                pw.Text(
                  'Ministerio de Seguridad Pública',
                  style: pw.TextStyle(fontSize: 11),
                ),
                pw.Container(
                  height: 20,
                  child: pw.Text(
                    'AÑO 2023',
                    style: pw.TextStyle(fontSize: 11),
                  ),
                ),
                pw.Text(
                  'REPORTE DE: INSPECCIÓN DE EMBARCACIONES',
                  style: pw.TextStyle(fontSize: 9),
                ),
                pw.Text(
                  'REGISTRO DE EMBARCACION',
                  style: const pw.TextStyle(fontSize: 9),
                ),
              ],
            ),
            pw.Image(pw.MemoryImage(img2),
                fit: pw.BoxFit.fitHeight, height: 60, width: 60),
          ],
        ),
        pw.SizedBox(height: 15),
      ],
    );
  }

  ///FIn encabezado
  ///
  ///Inicio export con List
  Future<void> generatePDF(List<List<String>> data) async {
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/example.pdf');
    final filePath = '${output.path}/example.pdf';

    final pdf = pw.Document();

    final table = buildCombinedTable(data);

    ///Primera pagina
    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              buildHeader(),
              table,
            ],
          );
        },
      ),
    );

    ///Segunda pagina
    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              buildHeader(),
              datafilled(filledTable),
            ],
          );
        },
      ),
    );

    await file.writeAsBytes(await pdf.save());

    // Realizar otras operaciones con el PDF generado, como compartir o imprimir

    // ...
  }

  ///Fin export con List
  ///
  ///Inicio FilledTable
  final List<List<String>> filledTable = [
    [
      'Categoría Delito',
      'Código de incidente',
      'Descripción',
      'Delito cometido'
    ],
    ['Delito común', 'DC1', 'Piratería', 'X'],
    ['Delito común', 'DC2', 'Transporte de ilegales', ' '],
    ['Delito común', 'DC3', 'Robo de productos, embarcación, motores', ''],
    ['*****', '*****', '*****', '*****'],
    ['*****', '*****', '*****', '*****'],
    ['*****', '*****', '*****', '*****'],
    ['*****', '*****', '*****', '*****'],
    ['*****', '*****', '*****', '*****'],
    ['*****', '*****', '*****', '*****'],
    ['*****', '*****', '*****', '*****'],
    ['*****', '*****', '*****', '*****'],
    ['*****', '*****', '*****', '*****'],
    ['*****', '*****', '*****', '*****'],
    ['*****', '*****', '*****', '*****'],
    ['*****', '*****', '*****', '*****'],
    ['*****', '*****', '*****', '*****'],
  ];

  ///Fin filled table
  ///
  /// Inicio buildCombinedTable declarada en clase
  pw.Table buildCombinedTable(List<List<String>> data) {
    final List<pw.TableRow> tableRows = data.map((rowData) {
      final List<pw.Widget> cells = rowData.map((item) {
        return pw.Container(
          padding: const pw.EdgeInsets.all(5),
          alignment: pw.Alignment.center,
          child: pw.Text(item),
        );
      }).toList();

      return pw.TableRow(children: cells);
    }).toList();

    return pw.Table(
      border: pw.TableBorder.all(
        color: PdfColors.black,
        width: 1,
        style: pw.BorderStyle.solid,
      ),
      children: tableRows,
    );
  }

  ///Fin buildCombinedTable declarada en clase
  ///
  ///Inicio datafilled class
  pw.Widget datafilled(List<List<String>> filledTable) {
    return buildCombinedTable(filledTable);
  }

  ///Inicio buildbasicdata class
  ///
  ///Inicio export con context
  Future<void> exportPDF(BuildContext context) async {
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/example.pdf');
    final filePath = '${output.path}/example.pdf';

    final ByteData bytes = await rootBundle.load('assets/Msp_logo.jpg');
    final Uint8List img1 = bytes.buffer.asUint8List();
    final ByteData bytes1 = await rootBundle.load('assets/gc_logo.png');
    final Uint8List img2 = bytes1.buffer.asUint8List();

    pw.Widget buildHeader() {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Image(pw.MemoryImage(img1),
                  fit: pw.BoxFit.fitHeight, height: 50, width: 50),
              pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'SERVICIO NACIONAL DE GUARDACOSTAS',
                    style: const pw.TextStyle(fontSize: 11),
                  ),
                  pw.Text(
                    'Ministerio de Seguridad Pública',
                    style: pw.TextStyle(fontSize: 11),
                  ),
                  pw.Container(
                    height: 20,
                    child: pw.Text(
                      'AÑO 2023',
                      style: pw.TextStyle(fontSize: 11),
                    ),
                  ),
                  pw.Text(
                    'REPORTE DE: INSPECCIÓN DE EMBARCACIONES',
                    style: pw.TextStyle(fontSize: 9),
                  ),
                  pw.Text(
                    'REGISTRO DE EMBARCACION',
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                ],
              ),
              pw.Image(pw.MemoryImage(img2),
                  fit: pw.BoxFit.fitHeight, height: 60, width: 60),
            ],
          ),
          pw.SizedBox(height: 15),
        ],
      );
    }

    pw.Widget buildBasicData() {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Datos básicos:',
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 10),
          pw.Text('Nombre: John Doe'),
          pw.Text('Edad: 30 años'),
          pw.Text('Género: Masculino'),
        ],
      );
    }

    pw.Widget buildTableCell(String label, String text) {
      return pw.Container(
        padding: const pw.EdgeInsets.all(5),
        alignment: pw.Alignment.center,
        child: pw.Container(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                label + "\n=",
                style: const pw.TextStyle(fontSize: 10),
                textAlign: pw.TextAlign.center,
              ),
              pw.SizedBox(height: 5),
              pw.Text(
                text,
                style: const pw.TextStyle(fontSize: 10),
                textAlign: pw.TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    pw.Table buildTable(List<String> data) {
      final rows = data.map((item) {
        return pw.TableRow(
          children: [
            buildTableCell(item, item),
          ],
        );
      }).toList();

      return pw.Table(
        border: pw.TableBorder.all(
          color: PdfColors.black,
          width: 0.5,
        ),
        columnWidths: {
          0: pw.FlexColumnWidth(1),
        },
        defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
        children: rows,
      );
    }

    final pdf = pw.Document();

    ///Primera página
    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              buildHeader(),
              pw.SizedBox(height: 250),
              buildTableCell("TONY", "DIOS"),
            ],
          );
        },
      ),
    );

    ///Segunda pagina
    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              buildHeader(),
              datafilled(filledTable),
            ],
          );
        },
      ),
    );

    await file.writeAsBytes(await pdf.save());

    try {
      OpenFile.open(filePath);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('PDF exportado exitosamente')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al abrir el archivo PDF')),
      );
    }
  }

  ///Fin export con context
}

///FIn clase
