import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:mood_tracker/views/grafico.dart';
class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<DateTime, String> _moods = {};

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pop(context);
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RespirePage()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PsicologosPage()),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MeuPerfilPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F9FC),
      body: Column(
        children: [
         
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(60.0), 
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                    _showMoodDialog(selectedDay);
                  },
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, day, focusedDay) {
                      final mood = _moods[day];
                      if (mood != null) {
                        return Center(
                          child: Text(
                            mood.split(' ')[0],
                            style: TextStyle(fontSize: 20),
                          ),
                        );
                      }
                      return Center(
                        child: Text(
                          day.day.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.bar_chart, size: 40, color: Color(0xFF81C7C6)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GraficoPage(moods: _moods)),
                  );
                },
              ),
            ),
          ),
        ],
      ),
     
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
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
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 67,
            height: 67,
            padding: EdgeInsets.all(8),
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
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  void _showMoodDialog(DateTime day) {
    showDialog(
      context: context,
      builder: (context) {
        String? selectedMood;
        return AlertDialog(
          title: Text('Selecionar Emoção'),
          content: DropdownButton<String>(
            value: selectedMood,
            hint: Text('Escolha seu mood'),
            onChanged: (String? newValue) {
              setState(() {
                selectedMood = newValue;
                _moods[day] = newValue!;
              });
              Navigator.pop(context);
            },
            items: <String>[
              '😊 Felicidade',
              '😢 Tristeza',
              '😡 Raiva',
              '😴 Cansaço',
              'Apatia',
              'Ansiedade'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}


class RespirePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Respire'),
        backgroundColor: Color(0xFF81C7C6),
      ),
      backgroundColor: Color(0xFFF6F9FC),
      body: Center(
        child: Text('Página Respire'),
      ),
    );
  }
}

class PsicologosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Psicólogos'),
        backgroundColor: Color(0xFF81C7C6),
      ),
      backgroundColor: Color(0xFFF6F9FC),
      body: Center(
        child: Text('Página Psicólogos'),
      ),
    );
  }
}

class MeuPerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
        backgroundColor: Color(0xFF81C7C6),
      ),
      backgroundColor: Color(0xFFF6F9FC),
      body: Center(
        child: Text('Página Meu Perfil'),
      ),
    );
  }
}

class GraficoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gráfico das Emoções'),
        backgroundColor: Color(0xFF81C7C6),
      ),
      backgroundColor: Color(0xFFF6F9FC),
      body: Center(
        child: Text('Gráfico das Emoções'),
      ),
    );
  }
}