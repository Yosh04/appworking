import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart' as pwg;

import 'package:flutter/material.dart';


//Carpetas de componentes.
import '../components/pdf_gen.dart';
import '../components/signature_pad.dart';


//Se importa cada widget para los formularios.
import './widgets form/navigationPrev.dart';
import './widgets form/inspectionForm.dart';
import './widgets form/boatForm.dart';
import 'widgets form/tripulationForm.dart';
import './widgets form/IncidentsForm.dart';
import './widgets form/ownerForm.dart';





class FormPage extends StatefulWidget {
  final String texto;
  const FormPage(this.texto, {super.key});
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {



  bool _isExpanded1 = false;
  List<dynamic> _formValuesInspection = [];
<<<<<<< HEAD
  Map<String, dynamic> tripulanteData = {};
=======
  Uint8List? signatureImage;
  int? numeroDefinitivoTripulacion =Ntripulacion ;
>>>>>>> f727170b867a47744aca10a5effcc075920f28a7

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guardacostas'),
        backgroundColor: const Color(0xFF1C207F),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              ExpansionTile(
                collapsedBackgroundColor: Colors.black54,
                backgroundColor: Colors.black26,
                iconColor: Colors.deepPurple,
                trailing: Icon(
                  _isExpanded1
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.deepPurple,
                ),
                title: const Text(
                  'Datos de inspección',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                onExpansionChanged: (bool expanded) {
                  setState(() {
                    _isExpanded1 = expanded;
                  });
                },
                initiallyExpanded: _isExpanded1,
                children: [
                  InspectionForm(),
                ],
              ),
              SizedBox(height: 10.0),
              ExpansionTile(
                collapsedBackgroundColor: Colors.black54,
                backgroundColor: Colors.black26,
                iconColor: Colors.deepPurple,
                trailing: Icon(
                  _isExpanded1
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.deepPurple,
                ),
                title: const Text(
                  'Datos de Embarcacion',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                onExpansionChanged: (bool expanded) {
                  setState(() {
                    _isExpanded1 = expanded;
                  });
                },
                initiallyExpanded: _isExpanded1,
                children: [
                  SingleChildScrollView(
                    child: FormularioEmbarcacionWidget(),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              ExpansionTile(
                collapsedBackgroundColor: Colors.black54,
                backgroundColor: Colors.black26,
                iconColor: Colors.deepPurple,
                trailing: Icon(
                  _isExpanded1
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.deepPurple,
                ),
                title: const Text(
                  'Datos de Tripulacion',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                onExpansionChanged: (bool expanded) {
                  setState(() {
                    _isExpanded1 = expanded;
                  });
                },
                initiallyExpanded: _isExpanded1,
                children: [
                  SingleChildScrollView(
                    child: TripulacionFormularioWidget(),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              ExpansionTile(
                collapsedBackgroundColor: Colors.black54,
                backgroundColor: Colors.black26,
                iconColor: Colors.deepPurple,
                trailing: Icon(
                  _isExpanded1
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.deepPurple,
                ),
                title: const Text(
                  'Datos de incidentes',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                onExpansionChanged: (bool expanded) {
                  setState(() {
                    _isExpanded1 = expanded;
                  });
                },
                initiallyExpanded: _isExpanded1,
                children: [
                  SingleChildScrollView(
                    child: IncidentsForm(),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              ExpansionTile(
                collapsedBackgroundColor: Colors.black54,
                backgroundColor: Colors.black26,
                iconColor: Colors.deepPurple,
                trailing: Icon(
                  _isExpanded1
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.deepPurple,
                ),
                title: const Text(
                  'Datos de propietarios',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                onExpansionChanged: (bool expanded) {
                  setState(() {
                    _isExpanded1 = expanded;
                  });
                },
                initiallyExpanded: _isExpanded1,
                children: [
                  SingleChildScrollView(
                    child: PropietarioFormularioWidget(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          signatureImage = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignatureScreen()),
          );
          if (signatureImage != null) {
            await saveSignatureAsPdf(signatureImage!);
          }
          setState(() {});
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: NavigationPrev(),

    );
  }
<<<<<<< HEAD
}
=======

  Future<void> saveSignatureAsPdf(Uint8List signatureImage) async {
    Directory appDocumentsDirectoryIMGPDF = Directory(
        '/storage/emulated/0/books');

    final pdf = pw.Document();

    final signatureImageWidget = pw.MemoryImage(signatureImage);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pwg.Image(signatureImageWidget);
        },
      ),
    );
    final outputFile = File('${appDocumentsDirectoryIMGPDF.path}/signature.pdf');
    await outputFile.writeAsBytes(await pdf.save());
  }
}

/*
floatingActionButton: FloatingActionButton(
onPressed: () {
print(_formValuesInspection);
},
child: Icon(Icons.save_alt_sharp),
),
*/
>>>>>>> f727170b867a47744aca10a5effcc075920f28a7
