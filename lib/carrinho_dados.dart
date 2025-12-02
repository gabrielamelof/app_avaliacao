List<Map<String, dynamic>> carrinhoGlobal = [];

void adicionarItem({
  required String tipo,
  required String nome,
  required double preco,
  required String imagem,
}) {
  for (var item in carrinhoGlobal) {
    if (item["nome"] == nome) {
      item["quantidade"]++;
      return;
    }
  }

  carrinhoGlobal.add({
    "tipo": tipo,
    "nome": nome,
    "preco": preco,
    "imagem": imagem,
    "quantidade": 1,
  });
}
