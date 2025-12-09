import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

Future<void> adicionaUsuarios() async {
  final firestore = FirebaseFirestore.instance;

  final url = Uri.parse("https://randomuser.me/api/?results=5");

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    for (var user in data['results']) {
      await firestore.collection("usuarios").add({
        "nome": "${user['name']['first']} ${user['name']['last']}",
        "email": user['email'],
        "senha": user['login']['password'],
      });
    }
  }
}
