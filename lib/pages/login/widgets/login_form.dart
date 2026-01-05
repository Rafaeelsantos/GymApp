import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cadastro/widgets/custom_input.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();
  final _password = TextEditingController();

  bool showPassword = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      print('Email: ${_email.text}');
      print('Senha: ${_password.text}');

      // Aqui você pode:
      // - chamar API
      // - autenticar Firebase
      // - navegar para Home
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomInput(
            label: 'Email',
            controller: _email,
            type: TextInputType.emailAddress,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Digite o email';
              if (!v.contains('@')) return 'Email inválido';
              return null;
            },
          ),
          const SizedBox(height: 16),

          CustomInput(
            label: 'Senha',
            controller: _password,
            obscure: !showPassword,
            suffix: IconButton(
              icon: Icon(
                showPassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.white70,
              ),
              onPressed: () {
                setState(() => showPassword = !showPassword);
              },
            ),
            validator: (v) {
              if (v == null || v.isEmpty) return 'Digite a senha';
              if (v.length < 6) return 'Senha inválida';
              return null;
            },
          ),

          const SizedBox(height: 30),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: const Color.fromARGB(255, 255, 111, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Entrar',
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 18),

          // Voltar para cadastro
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Não tem conta? Cadastre-se',
              style: GoogleFonts.orbitron(
                color: const Color.fromARGB(255, 255, 111, 0),
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
