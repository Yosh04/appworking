import 'package:flutter/material.dart';

class InspectionForm extends StatefulWidget {
  final ValueChanged<List<dynamic>> onFormValuesChanged;

  InspectionForm({required this.onFormValuesChanged});

  @override
  _InspectionFormState createState() => _InspectionFormState();
}

class _InspectionFormState extends State<InspectionForm> {
  TextEditingController _inspectionController = TextEditingController();
  String _currentValue = '';

  @override
  void dispose() {
    _inspectionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Fecha:'),
              SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: () {
                  _showDatePicker(context);
                },
                child: Text('Seleccionar fecha'),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Hora:'),
              SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: () {
                  _showTimePicker(context);
                },
                child: Text('Seleccionar hora'),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Numero de motores:'),
              SizedBox(width: 10.0),
              Expanded(
                child: TextField(
                  controller: _inspectionController,
                  onChanged: (value) {
                    setState(() {
                      _currentValue = value;
                    });
                  },
                  onEditingComplete: () {
                    widget.onFormValuesChanged([_currentValue]);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ).then((selectedDate) {
      if (selectedDate != null) {
        widget.onFormValuesChanged([selectedDate]);
      }
    });
  }

  void _showTimePicker(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((selectedTime) {
      if (selectedTime != null) {
        widget.onFormValuesChanged([selectedTime]);
      }
    });
  }
}
