import 'package:avaliacao_app/carrinho.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomePage(),
    CarrinhoPage(),
    Login(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,

        selectedItemColor: Colors.brown,  
        unselectedItemColor: const Color.fromARGB(255, 49, 32, 26),  
        backgroundColor: Colors.white,

        onTap: (index) {
          setState(() => currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Carrinho"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Login"),
        ],
      ),
    );
  }
}
