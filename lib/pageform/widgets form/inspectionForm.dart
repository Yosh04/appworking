import 'package:flutter/material.dart';

class InspectionForm extends StatefulWidget {
  @override
  _InspectionFormState createState() => _InspectionFormState();
}

class _InspectionFormState extends State<InspectionForm> {
  DateTime currentDateSpecial = DateTime.now();
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildFormField("Cantidad Aprox De Combustible"),
            SizedBox(height: 16.0),
            _buildTimePicker("Hora de inicio", startTime, (time) {
              setState(() {
                startTime = time;
              });
            }),
            SizedBox(height: 16.0),
            _buildTimePicker("Hora de final", endTime, (time) {
              setState(() {
                endTime = time;
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(String label) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildTimePicker(
      String label, TimeOfDay? selectedTime, Function(TimeOfDay) onTimeSelected) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  label,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Text(selectedTime?.format(context) ?? ''),
          ],
        ),
      ),
    );
  }
}
