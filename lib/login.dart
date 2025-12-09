import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'navbar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  String erro = "";
  String mensagem = "";

  @override
  void initState() {
    super.initState();
    importarUsuariosDaAPI();
  }

  Future<void> importarUsuariosDaAPI() async {
    QuerySnapshot totalUsuarios =
        await FirebaseFirestore.instance.collection("usuario").get();

  

    var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var resposta = await http.get(url);

    if (resposta.statusCode == 200) {
      List lista = json.decode(resposta.body);

      for (int i = 0; i < 7; i++) {
        var usuario = lista[i];
        await FirebaseFirestore.instance.collection("usuario").add({
          "nome": usuario["name"],
          "email": usuario["email"],
          "senha": "123", 
        });
      }

    }
  }
  Future<void> fazerLogin() async {
    String email = emailController.text.trim();
    String senha = senhaController.text.trim();

    if (email.isEmpty || senha.isEmpty) {
      setState(() => mensagem = "Preencha todos os campos");
      return;
    }

    QuerySnapshot resultado = await FirebaseFirestore.instance
        .collection("usuario")
        .where("email", isEqualTo: email)
        .where("senha", isEqualTo: senha)
        .get();

    if (resultado.docs.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NavBar(),
        ),
      );
    } else {
      setState(() => erro = "Email ou senha incorretos");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 186, 172),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10,
                ),
              ],
            ),

            child: Column(
              children: [
                const SizedBox(height: 50),
                Image.asset("assets/images/logo.png", width: 90),
                const SizedBox(height: 20),

                const Text(
                  "Café Capítulo",
                  style: TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: "PlayfairDisplay",
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  "Entre para descobrir livros e sabores",
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 18,
                    fontFamily: "PlayfairDisplay",
                  ),
                ),

                SizedBox(height: 20),

                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: const TextStyle(color: Colors.brown),
                      filled: true,
                      fillColor: Colors.brown.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: TextField(
                    controller: senhaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: const TextStyle(color: Colors.brown),
                      filled: true,
                      fillColor: Colors.brown.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => fazerLogin(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child: const Text(
                        "Entrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "PlayfairDisplay",
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),
                Text(erro, style: const TextStyle(color: Colors.red)),
                Text(mensagem, style: const TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
