import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_input.dart';
import '/pages/login/login_page.dart';

class CadastroForm extends StatefulWidget {
  const CadastroForm({super.key});

  @override
  State<CadastroForm> createState() => _CadastroFormState();
}

class _CadastroFormState extends State<CadastroForm> {
  final _formKey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _confirm = TextEditingController();

  bool showPass = false;
  bool showConfirm = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _pass.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      print("Nome: ${_name.text}");
      print("Email: ${_email.text}");
      print("Senha: ${_pass.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomInput(
            label: "Nome",
            controller: _name,
            validator: (v) {
              if (v == null || v.isEmpty) return "Digite o nome";
              return null;
            },
          ),
          const SizedBox(height: 14),

          CustomInput(
            label: "Email",
            controller: _email,
            type: TextInputType.emailAddress,
            validator: (v) {
              if (v == null || v.isEmpty) return "Digite o email";
              if (!v.contains("@")) return "Email inválido";
              return null;
            },
          ),
          const SizedBox(height: 14),

          CustomInput(
            label: "Senha",
            controller: _pass,
            obscure: !showPass,
            suffix: IconButton(
              icon: Icon(
                showPass ? Icons.visibility : Icons.visibility_off,
                color: Colors.white70,
              ),
              onPressed: () => setState(() => showPass = !showPass),
            ),
            validator: (v) {
              if (v == null || v.length < 6) return "Min. 6 caracteres";
              return null;
            },
          ),
          const SizedBox(height: 14),

          CustomInput(
            label: "Confirmar senha",
            controller: _confirm,
            obscure: !showConfirm,
            suffix: IconButton(
              icon: Icon(
                showConfirm ? Icons.visibility : Icons.visibility_off,
                color: Colors.white70,
              ),
              onPressed: () => setState(() => showConfirm = !showConfirm),
            ),
            validator: (v) {
              if (v != _pass.text) return "Senhas não coincidem";
              return null;
            },
          ),

          const SizedBox(height: 28),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: const Color.fromARGB(255, 255, 111, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Cadastrar',
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            borderRadius: BorderRadius.circular(4),
            child: Text(
              'Já tem login?',
              style: GoogleFonts.orbitron(
                color: const Color.fromARGB(255, 255, 111, 0),
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
