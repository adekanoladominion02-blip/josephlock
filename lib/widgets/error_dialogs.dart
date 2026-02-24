import 'package:flutter/material.dart';

class ErrorDialog {
  static void showInvalidFileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invalid File'),
          content: Text('The selected file is invalid. Please choose a correct file and try again.'),
          actions: <Widget>[ 
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void showHashMismatchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hash Mismatch'),
          content: Text('The file hash does not match the expected value. Please check the file and try again.'),
          actions: <Widget>[ 
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}