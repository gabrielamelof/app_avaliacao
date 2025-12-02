import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                  offset: Offset(0, 4),                
                ),
              ],
            ),

          

          child: Column(
            children: [
              SizedBox(height: 50),
              Image.asset("assets/images/logo.png", width: 90),
              SizedBox(height: 20),

              Text("Café Capítulo", style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: "PlayfairDisplay",
              ),),

            SizedBox(height: 5),

              Text("Entre para descobrir livros e sabores", style: TextStyle(
                color: Colors.brown,
                fontSize: 18,
                fontFamily: "PlayfairDisplay",
              ),),

            SizedBox(height: 20),

             ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 300),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.brown),
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
              constraints: BoxConstraints(maxWidth: 300),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.brown),
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
            constraints: BoxConstraints(maxWidth: 300),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
                onPressed: () {},
                child: Text(
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

            ],
          ),
        ),
      ),
      ),
    );
  }
}
