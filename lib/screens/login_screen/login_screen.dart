import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/screens/common/confirmation_dialog.dart';
import 'package:flutter_webapi_first_course/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passController = TextEditingController();

  AuthService service = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          border: Border.all(width: 8),
          color: Colors.white,
        ),
        child: Form(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Icon(Icons.bookmark, size: 64, color: Colors.brown),
                  const Text(
                    "Simple Journal",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "por Alura",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(thickness: 2),
                  ),
                  const Text("Entre ou Registre-se"),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(label: Text("E-mail")),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: _passController,
                    decoration: const InputDecoration(label: Text("Senha")),
                    keyboardType: TextInputType.visiblePassword,
                    maxLength: 16,
                    obscureText: true,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      login(context);
                    },
                    child: const Text("Continuar"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  login(BuildContext context) async {
    String email = _emailController.text;
    String password = _passController.text;

    try {
      bool result = await service.login(email: email, password: password);
    } on UserNotFoundException {
      if (context.mounted) {
        showConfirmationDialog(
          context,
          content:
              "Deseja criar um novo usuário usando o e-mail $email e a senha inserida?",
          confirmOption: "CRIAR",
        );
      }
    }
  }
}
