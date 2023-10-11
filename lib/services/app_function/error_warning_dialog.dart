import 'package:flutter/material.dart';
import 'package:step_up/services/asset_manager.dart';
import 'package:step_up/util/widgets/subtitle_widget.dart';

class WarningErrorDialog {
  static Future<void> showErrorOrWarningDialog(
      {required BuildContext context,
      required String subtitle,
      bool isError = true,
      required Function fct,
      required btnText}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  isError ? AssetManageer.alert : AssetManageer.warning,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SubTitleWidget(
                  text: subtitle,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !isError,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: SubTitleWidget(
                          text: subtitle,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        fct();
                        Navigator.pop(context);
                      },
                      child: SubTitleWidget(
                        text: btnText,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
