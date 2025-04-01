import 'package:appfluxolivre/src/widget/input_login_widget.dart';
import 'package:appfluxolivre/src/widget/input_reset_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailControllerLogin = TextEditingController();
  final TextEditingController passwordControllerLogin = TextEditingController();
  final TextEditingController emailControllerReset = TextEditingController();
  final TextEditingController codeControllerReset = TextEditingController();
  final TextEditingController passwordControllerReset = TextEditingController();
  final TextEditingController confirmPasswordControllerReset =
      TextEditingController();

  void showForgotPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 154, 214, 203),
        title: const Text('Recuperar Senha',
            style: TextStyle(color: Colors.black)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Digite seu e-mail para receber o código de recuperação.',
              style: TextStyle(color: Colors.black),
            ),
            InputResetPasswordWidget(
              hint: 'Digite seu e-mail',
              obscure: false,
              controller: emailControllerReset,
              keyboardType: TextInputType.numberWithOptions(),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child:
                const Text('Cancelar', style: TextStyle(color: Colors.black)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 86, 143, 137)),
            onPressed: () {
              Navigator.pop(context);
              _showCodeVerificationDialog(context);
            },
            child: const Text('Enviar', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  void _showCodeVerificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 154, 214, 203),
        title: const Text('Verificar Código',
            style: TextStyle(color: Colors.black)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Digite o código enviado ao seu e-mail.',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 10),
            InputResetPasswordWidget(
              hint: 'Digite o código',
              obscure: false,
              controller: codeControllerReset,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child:
                const Text('Cancelar', style: TextStyle(color: Colors.black)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 86, 143, 137)),
            onPressed: () {
              Navigator.pop(context);
              _showResetPasswordDialog(context);
            },
            child:
                const Text('Confirmar', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  void _showResetPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 154, 214, 203),
        title: const Text('Redefinir Senha',
            style: TextStyle(color: Colors.black)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Digite sua nova senha',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 10),
            InputResetPasswordWidget(
              hint: 'Nova Senha',
              obscure: true,
              controller: passwordControllerReset,
              keyboardType: TextInputType.numberWithOptions(),
            ),
            InputResetPasswordWidget(
              hint: 'Confirmar Nova Senha',
              obscure: true,
              controller: confirmPasswordControllerReset,
              keyboardType: TextInputType.numberWithOptions(),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child:
                const Text('Cancelar', style: TextStyle(color: Colors.black)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 86, 143, 137)),
            onPressed: () {
              // Lógica para salvar a nova senha
            },
            child: const Text('Salvar', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C7A74),
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centraliza verticalmente
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF78A29A),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Image(
                        image: AssetImage('assets/images/logotipo.png'),
                        fit: BoxFit.contain,
                        width: 300,
                        height: 200,
                      ),
                      const SizedBox(height: 5),
                      InputLoginWidget(
                        icon: Icons.email_outlined,
                        hint: 'Digite seu e-mail',
                        obscure: false,
                        controller: emailControllerLogin,
                        validator: Validatorless.multiple([
                          Validatorless.required('O e-mail é obrigatório'),
                          Validatorless.email('Digite um e-mail válido'),
                        ]),
                      ),
                      InputLoginWidget(
                        icon: Icons.lock_outline,
                        hint: 'Digite sua senha',
                        obscure: true,
                        controller: passwordControllerLogin,
                        validator: Validatorless.multiple([
                          Validatorless.required('A senha é obrigatória'),
                          Validatorless.min(
                              6, 'A senha deve ter pelo menos 6 caracteres'),
                        ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Não possui login? ",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/createuser');
                            },
                            child: const Text(
                              "Cadastre-se!",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      GestureDetector(
                        onTap: () => showForgotPasswordDialog(context),
                        child: const Text(
                          "Esqueceu a senha?",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 117, 172, 167),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                          elevation: 5,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/home');
                        },
                        child: const Text(
                          "ENTRAR",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
