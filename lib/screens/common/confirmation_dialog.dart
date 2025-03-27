import 'package:flutter/material.dart';

showConfirmationDialog(
  BuildContext context, {
  String title = "Atenção!",
  String content = "Você realmente deseja executar essa operação?",
  String confirmOption = "Confirmar",
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Cancelar", style: TextStyle(color: Colors.black54)),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              confirmOption.toUpperCase(),
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    },
  );
}
