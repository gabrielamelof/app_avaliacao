import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.asset("assets/images/logo.png", width: 45),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Café Capítulo",
                  style: TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Livros & Sabores",
                  style: TextStyle(
                    color: Color.fromARGB(255, 155, 92, 69),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Image.asset("assets/images/banner.png", width: 1400),
                SizedBox(height: 20),
                Column(
                  children: [
                    Text("Por que escolher a Café Capítulo?", 
                    style: TextStyle(color: const Color.fromARGB(255, 85, 43, 28),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "PlayfairDisplay",
                    ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       Container(
                          width: 250,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 243, 228, 224),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.menu_book, size: 50, color: Colors.brown),
                              SizedBox(height: 10),
                              Text(
                                "Livros Selecionados",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                  fontFamily: "PlayfairDisplay",
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Uma curadoria especial de clássicos e bestsellers para todos os gostos",
                                style: TextStyle(fontSize: 16, color: Colors.brown),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: 250,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 243, 228, 224),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.coffee, size: 50, color: Colors.brown),
                              SizedBox(height: 10),
                              Text(
                                "Cafés Premium",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                  fontFamily: "PlayfairDisplay",
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Grãos especiais e blends exclusivos para sua experiência perfeita",
                                style: TextStyle(fontSize: 16, color: Colors.brown),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        
                    ],),


                  SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       Container(
                          width: 250,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 243, 228, 224),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.shopping_bag, size: 50, color: Colors.brown),
                              SizedBox(height: 10),
                              Text(
                                "Entrega Rápida",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                  fontFamily: "PlayfairDisplay",
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Receba seus produtos frescos com segurança e agilidade",
                                style: TextStyle(fontSize: 16, color: Colors.brown),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: 250,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 243, 228, 224),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.star, size: 50, color: Colors.brown),
                              SizedBox(height: 10),
                              Text(
                                "Qualidade Garantida",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                  fontFamily: "PlayfairDisplay",
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Produtos selecionados com cuidado e paixão especialmente para você",
                                style: TextStyle(fontSize: 16, color: Colors.brown),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        
                    ],)
                  ],
                ),

              SizedBox(height: 20),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Destaques da semana", style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                      fontFamily: "PlayfairDisplay",
                    ),),
                    Text("Nossas recomendações especiais para você!", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                      fontFamily: "PlayfairDisplay",
                    ),),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
