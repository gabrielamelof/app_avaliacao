import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'editar.dart';

class Compras extends StatefulWidget {
  const Compras({super.key});

  @override
  State<Compras> createState() => _ComprasState();
}

class _ComprasState extends State<Compras> {

  Future<void> _excluirCompra(String id) async {
    await FirebaseFirestore.instance.collection("compras").doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E4E0),

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Histórico de Compras",
          style: TextStyle(
            color: Colors.brown[800],
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: "PlayfairDisplay",
          ),
        ),
        centerTitle: true,
      ),

      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("compras").orderBy("data", descending: true).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.brown),
            );
          }

          var docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return Center(
              child: Text(
                "Faça uma compra primeiro",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.brown,
                  fontFamily: "PlayfairDisplay",
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: docs.length,
            itemBuilder: (context, index) {

              var compra = docs[index];
              List itens = compra["produtos"] ?? [];
              String produtosFormatados = itens.map((e) {
                if (e is Map) {
                  return "${e["nome"]} (${e["quantidade"]}x)";
                }
                return "";
              }).where((e) => e.isNotEmpty).join(", ");

              double total = compra["total"] ?? 0;

              String dataFormatada =
                  compra["data"] != null ? compra["data"].toDate().toString().substring(0, 16) : "";

              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
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
                      produtosFormatados,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[800],
                        fontFamily: "PlayfairDisplay",
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Total: R\$ ${total.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.brown,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Data: $dataFormatada",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.brown,
                      ),
                    ),

                    SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => EditarCompra(
                                  id: compra.id,
                                  itens: itens,
                                  total: total,
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            "Editar",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),

                        SizedBox(width: 10),

                        TextButton(
                          onPressed: () {
                            _excluirCompra(compra.id);
                          },
                          child: const Text(
                            "Excluir",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
