import 'package:flutter/material.dart';
import 'package:psibem/views/calendario.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mood Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  
  static final List<Widget> _pages = [
    const Center(child: Text('Para Você')),
    const Center(child: Text('emoções')), 
    const Center(child: Text('Respire')),
    const Center(child: Text('Psicólogos')),
    const Center(child: Text('Meu Perfil')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], 
      bottomNavigationBar: Container(
        height: 100,
        decoration: const BoxDecoration(
          color: Color(0xFF81C7C6), 
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'Para Você', 0),
            _buildNavItem(Icons.calendar_today, 'Emoções', 1),
            _buildNavItem(Icons.self_improvement, 'Respire', 2),
            _buildNavItem(Icons.contact_page, 'Psicólogos', 3),
            _buildNavItem(Icons.person, 'Meu Perfil', 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        if (index == 1) {
          
          final calendarioPage = Calendario(); 
         // calendarioPage.initialize(); 
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => calendarioPage),
          );
        } else {
          
          _onItemTapped(index);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 67, 
            height: 67, 
            padding: const EdgeInsets.all(8), 
            decoration: BoxDecoration(
              color: _selectedIndex == index ? Colors.white.withOpacity(0.2) : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 40, 
              color: Colors.white, 
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}