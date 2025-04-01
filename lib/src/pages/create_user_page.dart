import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:appfluxolivre/src/widget/input_create_user_widget.dart';

class CreateUserPage extends StatelessWidget {
  CreateUserPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameControllerCreateUser =
      TextEditingController();
  final TextEditingController emailControllerCreateUser =
      TextEditingController();
  final TextEditingController passwordControllerCreateUser =
      TextEditingController();
  final TextEditingController confirmPasswordControllerCreateUser =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C7A74),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFF78A29A),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/logotipo.png',
                    fit: BoxFit.contain,
                    width: 270,
                    height: 200,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Preencha os Dados',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  InputCreateUserWidget(
                    hint: 'Digite seu nome',
                    icon: Icons.person_outline,
                    obscure: false,
                    controller: nameControllerCreateUser,
                    // validator: Validatorless.required('Nome é obrigatório'),
                  ),
                  InputCreateUserWidget(
                    hint: 'Digite seu e-mail',
                    icon: Icons.email_outlined,
                    obscure: false,
                    controller: emailControllerCreateUser,
                    validator: Validatorless.multiple([
                      // Validatorless.required('E-mail é obrigatório'),
                      // Validatorless.email('E-mail inválido'),
                    ]),
                  ),
                  InputCreateUserWidget(
                    hint: 'Digite sua senha',
                    icon: Icons.lock_outline,
                    obscure: true,
                    controller: passwordControllerCreateUser,
                    validator: Validatorless.multiple([
                      // Validatorless.required('Senha é obrigatória'),
                      // Validatorless.min(
                      //     6, 'A senha deve ter pelo menos 6 caracteres'),
                    ]),
                  ),
                  InputCreateUserWidget(
                    hint: 'Confirme sua senha',
                    icon: Icons.lock_outline,
                    obscure: true,
                    controller: confirmPasswordControllerCreateUser,
                    validator: Validatorless.multiple([
                      // Validatorless.required(
                      //     'Confirmação de senha é obrigatória'),
                      // Validatorless.compare(
                      //     passwordController, 'As senhas não coincidem'),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA8CFB4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(120, 45),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        Navigator.of(context).pushNamed('/home');
                      }
                    },
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pop(); // Volta para a tela anterior (Login)
                    },
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
