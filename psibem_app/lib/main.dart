import 'package:flutter/material.dart';
import 'package:psibem_app/screens/home/home_page.dart';
import 'package:psibem_app/screens/login/login_page.dart';
import 'package:psibem_app/widgets/custom_bottom_navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => BottomNavigationScreen(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  // Função para mudar o índice
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    LoginPage(),
    /* EmotionsPage(),
    BreathingPage(),
    PsychologistsPage(),
    ProfilePage(),*/
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Exibe a página de acordo com o índice
      bottomNavigationBar: CustomBottomNavbar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Passa a função de navegação
      ),
    );
  }
}
