import 'package:flutter/material.dart';
import './widgets form/navigationPrev.dart';
import './widgets form/inspectionForm.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  bool _isExpanded1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guardacostas'),
        backgroundColor: const Color(0xFF1C207F),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Adjust the value according to your preferences
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50,
              color: Colors.white,
              child: const Center(
                child: Text(
                  'Documentos Recientes',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF1C207F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ExpansionTile(
              collapsedBackgroundColor: Colors.black54,
              backgroundColor: Colors.black26,
              iconColor: Colors.deepPurple,
              trailing: Icon(
                _isExpanded1 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: Colors.deepPurple,
              ),
              title: const Text(
                'Datos de inspección',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _isExpanded1 = expanded;
                });
              },
              initiallyExpanded: _isExpanded1,
              children: [
                inspectionForm(), // Methods where all the boat data is stored
              ],
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
      bottomNavigationBar: NavigationPrev(),
    );
  }

  Future<DateTime?> showDatePickerWidget(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2021),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(),
          child: child!,
        );
      },
    );

    return selectedDate;
  }

}
