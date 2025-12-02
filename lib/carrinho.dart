import 'package:flutter/material.dart';
import 'carrinho_dados.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({super.key});

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  List<Map<String, dynamic>> itens = carrinhoGlobal;

  double get subtotal {
    double total = 0;
    for (var item in itens) {
      total += item["preco"] * item["quantidade"];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 244, 240),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Carrinho de Compras",
          style: TextStyle(
            color: Colors.brown[800],
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: itens.isEmpty
          ? Center(
              child: Text(
                "Seu carrinho está vazio ☕📚",
                style: TextStyle(fontSize: 20, color: Colors.brown),
              ),
            )

          // ========= LISTVIEW PRINCIPAL =========
          : ListView(
              padding: EdgeInsets.all(20),
              children: [
                // ========== LISTA DE ITENS ==========
                ListView.builder(
                  itemCount: itens.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var item = itens[index];

                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Row(
                        children: [
                          // IMAGEM
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(item["imagem"]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          SizedBox(width: 20),

                          // TEXTOS E QUANTIDADE
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["tipo"],
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 197, 82, 43),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height: 5),

                                Text(
                                  item["nome"],
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.brown[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height: 15),

                                // QUANTIDADE
                                Container(
                                  width: 130,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 226, 238, 231),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: () {
                                          setState(() {
                                            if (item["quantidade"] > 1) {
                                              item["quantidade"]--;
                                            }
                                          });
                                        },
                                      ),

                                      Text(
                                        item["quantidade"].toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.brown,
                                        ),
                                      ),

                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            item["quantidade"]++;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 20),

                          // PREÇO
                          Text(
                            "R\$ ${item["preco"].toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[800],
                            ),
                          ),

                          // DELETAR
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red[400]),
                            onPressed: () {
                              setState(() {
                                itens.remove(item);
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),

                SizedBox(height: 20),

                // =============== RESUMO DO PEDIDO ===============
                Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Resumo do Pedido",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.brown[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subtotal", style: TextStyle(fontSize: 18)),
                          Text(
                            "R\$ ${subtotal.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Entrega", style: TextStyle(fontSize: 18)),
                          Text("R\$ 5.00", style: TextStyle(fontSize: 18)),
                        ],
                      ),

                      SizedBox(height: 40),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[900],
                            ),
                          ),
                          Text(
                            "R\$ ${(subtotal + 5).toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[900],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 199, 113, 79),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Finalizar Compra",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      Center(
                        child: Text(
                          "Entrega em até 3 dias úteis",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
