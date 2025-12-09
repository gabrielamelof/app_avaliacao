import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditarCompra extends StatefulWidget {
  final String id;
  final List itens;
  final double total;

  const EditarCompra({
    super.key,
    required this.id,
    required this.itens,
    required this.total,
  });

  @override
  State<EditarCompra> createState() => _EditarCompraState();
}

class _EditarCompraState extends State<EditarCompra> {
  late List<Map<String, dynamic>> produtosEditados;

  @override
  void initState() {
    super.initState();
    produtosEditados = widget.itens.map((e) => {
          "nome": e["nome"],
          "quantidade": e["quantidade"],
        }).toList();
  }

  Future<void> salvarEdicao() async {
    double novoTotal = 0;

    for (var p in produtosEditados) {
      double preco = (p["preco"] ?? 0).toDouble(); 
      novoTotal += preco * p["quantidade"];
    }

    if (widget.total > 0 && novoTotal == 0) {
      novoTotal = widget.total;
    }

    await FirebaseFirestore.instance.collection("compras").doc(widget.id).update({
      "produtos": produtosEditados,
      "total": novoTotal,
    });

    Navigator.pop(context); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E4E0),

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Editar Compra",
          style: TextStyle(
            color: Colors.brown[800],
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: "PlayfairDisplay",
          ),
        ),
        centerTitle: true,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: produtosEditados.length,
        itemBuilder: (context, index) {
          var produto = produtosEditados[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(2, 2),
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  produto["nome"],
                  style: TextStyle(
                    color: Colors.brown[900],
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: "PlayfairDisplay",
                  ),
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    const Text(
                      "Quantidade: ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.brown,
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (produto["quantidade"] > 1) {
                            produto["quantidade"]--;
                          }
                        });
                      },
                      icon: const Icon(Icons.remove),
                      color: Colors.brown,
                    ),

                    Text(
                      produto["quantidade"].toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          produto["quantidade"]++;
                        });
                      },
                      icon: const Icon(Icons.add),
                      color: Colors.brown,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown[700],
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: salvarEdicao,
          child: const Text(
            "Salvar alterações",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
