import 'package:flutter/material.dart';
import './widgets form/navigationPrev.dart';
import './widgets form/inspectionForm.dart';
import './widgets form/boatForm.dart';
import 'widgets form/tripulationForm.dart';
import './widgets form/IncidentsForm.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}


late final int Ntripulacion;

void getNumTripulacion( int b){
  Ntripulacion =b;
}



class _FormPageState extends State<FormPage> {
  bool _isExpanded1 = false;
  List<dynamic> _formValuesInspection = [];

  int? numeroDefinitivoTripulacion =Ntripulacion ;

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
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationPrev(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(_formValuesInspection);
        },
        child: Icon(Icons.save_alt_sharp),
      ),
    );
  }


}


