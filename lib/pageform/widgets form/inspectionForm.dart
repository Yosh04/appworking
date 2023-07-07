import 'package:flutter/material.dart';

class inspectionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Numero de motores:'),
            SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
