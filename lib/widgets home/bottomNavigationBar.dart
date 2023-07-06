import 'package:flutter/material.dart';
import 'package:untitled/pageform/formPage.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      MaterialPageRoute(builder: (context) => FormPage()))
                },
                icon: const Icon(
                  Icons.add_circle_outline_outlined,
                  color: Color(0xFF1C207F),
                  size: 38,
                ),
              ),
              const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.upload_file_outlined,
                  color: Color(0xFF1C207F),
                  size: 38,
                ),
              ),
              const IconButton(
                onPressed: null,
                icon: Icon(
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
