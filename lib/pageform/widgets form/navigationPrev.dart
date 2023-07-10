import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/services.dart';
import '../../components/pdf_gen.dart';
import '../../models/InspectionFormModel.dart';

class NavigationPrev extends StatelessWidget {
  var currentIndex = 0;
  Future<void> exportPDF(BuildContext context) async {
    final pdfGenerator = PdfGenerator();
    await pdfGenerator.exportPDF(context);
  }
  PdfGenerator pdfGenerator = PdfGenerator();

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    final inspectionForm = Provider.of<InspectionFormModel>(context);
    List<List<String>> data2 = inspectionForm.getToList();

    List<List<String>> data3 = inspectionForm.getToListIncident();

    return Container(
      margin: EdgeInsets.all(displayWidth * .05),
      height: displayWidth * .155,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: BottomAppBar(
        elevation: 0, // Elimina la sombra del BottomAppBar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                //exportPDF(context); // Actualicé el nombre del método

                pdfGenerator.generatePDF(context,data3);
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF1C207F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Previsualizar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
