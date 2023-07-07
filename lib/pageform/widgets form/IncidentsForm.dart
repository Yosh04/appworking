import 'package:flutter/material.dart';

class IncidentsForm extends StatefulWidget {
  @override
  _IncidentsFormState createState() => _IncidentsFormState();
}

class _IncidentsFormState extends State<IncidentsForm> {
  bool _isExpanded1 = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10.0),
            ExpansionTile(
              collapsedBackgroundColor: Colors.black54,
              backgroundColor: Colors.black26,
              iconColor: Colors.deepPurple,
              trailing: Icon(
                _isExpanded1 ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: Colors.deepPurple,
              ),
              title: Text(
                'Datos de incidentes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _isExpanded1 = expanded;
                });
              },
              initiallyExpanded: _isExpanded1,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // Add your form fields here
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
