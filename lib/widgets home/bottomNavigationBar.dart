import 'package:flutter/material.dart';
import 'package:untitled/pageform/formPage.dart';
import '../components/pdf_gen.dart';
import '../models/InspectionFormModel.dart';
import 'package:provider/provider.dart';


class CustomBottomNavigationBar extends StatelessWidget {

  PdfGenerator pdfGenerator = PdfGenerator();

  List<List<String>> data = [
    ['Dato 1', 'Dato 2'],
    ['Dato 3', 'Dato 4'],
    ['Dato 7', 'Dato 8' ],
    ['Dato 10', 'Dato 11'],
    ['Dato 13', 'Dato 14'],
    ['Dato 16', 'Dato 17'],
  ];


  @override
  Widget build(BuildContext context) {
    final inspectionForm = Provider.of<InspectionFormModel>(context);
    List<List<String>> data1 = inspectionForm.getToList();
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color(0xFFF1F4F8),
        child: Container(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FormPage("")))
                },
                icon: const Icon(
                  Icons.add_circle_outline_outlined,
                  color: Color(0xFF1C207F),
                  size: 38,
                ),
              ),
               IconButton(
                onPressed: () {
                  pdfGenerator.generatePDF(context,data1);
                },
                icon: const Icon(
                  Icons.upload_file_outlined,
                  color: Color(0xFF1C207F),
                  size: 38,
                ),
              ),

               IconButton(
                onPressed: () {
                  pdfGenerator.exportPDF(context);
                },
                icon: const Icon(
                  Icons.settings,
                  color: Color(0xFF1C207F),
                  size: 38,
                ),
              ),
              const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.exit_to_app,
                  color: Color(0xFF1C207F),
                  size: 38,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
