import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penulisan_ilmiah_application/Services%20Firebase/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  var isLoader = false;
  var authService = AuthService();

  Future _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoader = false;
      });

      var dataaccount = {
        "email": _emailController.text,
        "password": _passController.text
      };

      await authService.login(dataaccount, context);
      setState(() {
        isLoader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Hero(
                tag: "adminLoginAnimation",
                child: CircleAvatar(
                  radius: 55,
                  child: Icon(
                    Icons.person,
                    size: 65,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "ADMIN",
                style: GoogleFonts.poppins(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 15),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "E-mail",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Harap mengisikan e-mail';
                    }
                    RegExp emailFormat =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (emailFormat.hasMatch(value)) {
                      return null;
                    }
                    return 'Harap masukkan e-mail sesuai format';
                  },
                ),
              ),
              TextFormField(
                controller: _passController,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Harap mengisikan password dengan benar";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        color: Colors.green[700],
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    )),
                onTap: () {
                  _submitForm();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
