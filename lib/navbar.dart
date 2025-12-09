import 'package:avaliacao_app/compras.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'carrinho.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});  

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;

  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      const HomePage(),
      const CarrinhoPage(),
      Login(),
      Compras(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Color.fromARGB(255, 49, 32, 26),
        backgroundColor: Colors.white,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Carrinho"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Login"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: "Compras"),
        ],
      ),
    );
  }
}
