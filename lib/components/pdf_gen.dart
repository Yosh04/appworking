import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';

class PdfGenerator {
  Future<void> exportPDF(BuildContext context) async {
    /// Definir variables
    //String dinaText = '73';

    /// Obtener el directorio temporal y crear el archivo PDF
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/example.pdf');
    final filePath = '${output.path}/example.pdf';

    /// Cargar las imágenes desde los archivos
    final ByteData bytes = await rootBundle.load('assets/Msp_logo.jpg');
    final Uint8List img1 = bytes.buffer.asUint8List();
    final ByteData bytes1 = await rootBundle.load('assets/gc_logo.png');
    final Uint8List img2 = bytes1.buffer.asUint8List();

    /// Construir el encabezado del documento
    pw.Widget buildHeader() {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Image(pw.MemoryImage(img1), fit: pw.BoxFit.fitHeight, height: 50, width: 50),
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
              pw.Image(pw.MemoryImage(img2), fit: pw.BoxFit.fitHeight, height: 60, width: 60),
            ],
          ),
          pw.SizedBox(height: 15),
        ],
      );
    }

    /// Construir una celda personalizada de la tabla
    pw.Widget buildTableCell(String label, String text) {
      return pw.Container(
        padding: const pw.EdgeInsets.all(5),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              label,
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
      );
    }

    /// Construir una tabla a partir de una lista de datos
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

    /// Construir una tabla combinada a partir de una lista de listas de datos
    pw.Table buildCombinedTable(List<List<String>> data) {
      final rows = data.map((rowData) {
        final cells = rowData.map((item) {
          return pw.Container(
            child: buildTableCell(item, item),
          );
        }).toList();

        return pw.TableRow(children: cells);
      }).toList();

      return pw.Table(
        border: pw.TableBorder.all(
          color: PdfColors.black,
          width: 0.5,
        ),
        columnWidths: {
          for (var i = 0; i < data[0].length; i++)
            i: pw.FlexColumnWidth(1),
        },
        defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
        children: rows,
      );
    }

    /// Generar el documento PDF
    final pdf = pw.Document();

    /// Agregar la primera página
    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              buildHeader(),
              buildTable(['Item 1', 'Item 2', 'Item 3']),
            ],
          );
        },
      ),
    );

    /// Agregar la segunda página
    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              buildHeader(),
              buildCombinedTable([
                ['Cell 1', 'Cell 2'],
                ['Cell 3', 'Cell 4'],
              ]),
            ],
          );
        },
      ),
    );

    /// Guardar el archivo PDF en el directorio temporal
    await file.writeAsBytes(await pdf.save());

    try {
      /// Abrir el archivo PDF
      OpenFile.open(filePath);
      /// Mostrar un SnackBar para notificar al usuario
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('PDF exportado exitosamente')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al abrir el archivo PDF')),
      );
    }
  }
}
