import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class CustomDialog {
  BuildContext context;
  String title;
  String desc;

  CustomDialog({
    required this.context,
    required this.title,
    required this.desc,
  }) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      title: title,
      desc: desc,
      dismissOnTouchOutside: false,
      onDissmissCallback: (type) {
        Navigator.of(context).pop();
      },
      btnCancelText: "Close App",
      btnCancelOnPress: () {
        Navigator.of(context).pop(true);
      },
    ).show();
  }
}
