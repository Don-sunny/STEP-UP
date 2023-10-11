import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppFunctioins {
  static Future<void> imagePickerDialog({
    required BuildContext context,
    required Function cameraFun,
    required Function galleryFun,
    required Function removeFun,
  }) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(
              child: Text(
                'Choose option',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(children: [
                TextButton.icon(
                  onPressed: () {
                    cameraFun();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text('Camera'),
                ),
                TextButton.icon(
                  onPressed: () {
                    galleryFun();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.browse_gallery),
                  label: const Text('Gallery'),
                ),
                TextButton.icon(
                  onPressed: () {
                    removeFun();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(CupertinoIcons.delete),
                  label: const Text('Remove'),
                )
              ]),
            ),
          );
        });
  }
}
