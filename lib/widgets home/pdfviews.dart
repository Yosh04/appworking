import 'dart:io';
import 'package:flutter/material.dart';
import '../components/selectFile.dart';
import 'package:path/path.dart';

Widget pdfView(List<FileSystemEntity> files) {
  return Expanded(
    child: Container(
      color: Colors.black12,
      child: ListView.separated(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: files.length,
        itemBuilder: (context, index) {
          String fileName = basename(files[index].path);
          return ElevatedButton(
            onPressed: () {
              pickFile(files[index].path);
            },
            child: Container(
              height: 60,
              child: Row(
                children: [
                  const Icon(Icons.picture_as_pdf, color: Colors.red, size: 50),
                  Flexible(
                    child: Text(
                      fileName,
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
      ),
    ),
  );
}
