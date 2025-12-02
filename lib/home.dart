import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'carrinho_dados.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void adicionarProduto({
    required String tipo,
    required String nome,
    required double preco,
    required String imagem,
  }) {
    adicionarItem(
      tipo: tipo,
      nome: nome,
      preco: preco,
      imagem: imagem,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$nome foi adicionado ao carrinho!"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.brown,
      ),
    );

    setState(() {});
  }

  Widget buildCard({
    required String image,
    required String categoria,
    required String titulo,
    required String descricao,
    required String preco,
  }) {
    return Container(
      width: 320,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              image,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoria,
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 12,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[800],
                    fontFamily: "PlayfairDisplay",
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  descricao,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.brown[600],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      preco,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[800],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD87B4A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                      ),
                      onPressed: () {
                        double precoConvertido =
                            double.parse(preco.replaceAll("R\$", "").replaceAll(",", "."));

                        adicionarProduto(
                          tipo: categoria,
                          nome: titulo,
                          preco: precoConvertido,
                          imagem: image,
                        );
                      },
                      child: Row(
                        children: [
                          Icon(Icons.add, color: Colors.white, size: 18),
                          SizedBox(width: 5),
                          Text("Adicionar",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
                      style: TextStyle(
                        color: const Color.fromARGB(255, 85, 43, 28),
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
                      ],
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
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Column(
                  children: [
                    Text(
                      "Destaques da semana",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        fontFamily: "PlayfairDisplay",
                      ),
                    ),
                    Text(
                      "Nossas recomendações especiais para você!",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.brown,
                        fontFamily: "PlayfairDisplay",
                      ),
                    ),

                    CarouselSlider(
                      options: CarouselOptions(
                        height: 500,
                        enlargeCenterPage: false,
                        enableInfiniteScroll: true,
                        autoPlay: false,
                        viewportFraction: 0.50,
                      ),
                      items: [
                        buildCard(
                          image: "assets/images/tela1.jpg",
                          categoria: "LIVRO",
                          titulo: "O Pequeno Príncipe",
                          descricao: "Um clássico atemporal sobre amor e amizade.",
                          preco: "R\$ 34,90",
                        ),

                        buildCard(
                          image: "assets/images/cafe.jpg",
                          categoria: "CAFÉ",
                          titulo: "Café Gourmet 250g",
                          descricao: "Torra média, aroma intenso e sabor marcante.",
                          preco: "R\$ 19,50",
                        ),

                        buildCard(
                          image: "assets/images/cappucino.jpg",
                          categoria: "CAFÈ",
                          titulo: "Capuccino",
                          descricao: "Delicioso capuccino com toques de canela",
                          preco: "R\$ 49,90",
                        ),

                        buildCard(
                          image: "assets/images/cupcake.jpg",
                          categoria: "CAFÈ",
                          titulo: "Cupcake",
                          descricao: "Massa de Baunilha com recheio de morango e chantilly",
                          preco: "R\$ 49,90",
                        ),

                        buildCard(
                          image: "assets/images/frapuccino.jpg",
                          categoria: "CAFÈ",
                          titulo: "Frapuccino",
                          descricao: "",
                          preco: "R\$ 49,90",
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 30),

                Container(
                  color: const Color.fromARGB(255, 243, 228, 224),
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Um Lugar para descobrir e Saborear",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4B2E19),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "No Café Capítulo, acreditamos que cada livro tem uma história para contar e cada café, um sabor para despertar. "
                        "Criamos um espaço acolhedor onde leitores e apreciadores de café se encontram para compartilhar momentos especiais.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: Color(0xFF6E4E35),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
