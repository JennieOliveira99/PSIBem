import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:psibem/views/calendario.dart';

class GraficoPage extends StatefulWidget {
  final Map<DateTime, String> moods; 
  const GraficoPage({super.key, required this.moods});

  @override
  _GraficoPageState createState() => _GraficoPageState();
}

class _GraficoPageState extends State<GraficoPage> {
  String _selectedPeriod = 'Mês'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FC),
      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4)),
                ],
              ),
              child: DropdownButton<String>(
                value: _selectedPeriod,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedPeriod = newValue!;
                  });
                },
                items: <String>['Semana', 'Mês', 'Ano']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                underline: const SizedBox(), 
                isExpanded: true,
              ),
            ),
          ),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),)
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BarChart(
                    BarChartData(
                      barGroups: _getBarGroups(),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: true),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return Text(_getBottomTitle(value));
                            },
                          ),
                        ),
                      ),
                      gridData: FlGridData(show: false),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
     
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


 List<BarChartGroupData> _getBarGroups() {
  final Map<String, int> emotionCounts = _countEmotionsByPeriod();
  final Map<String, Color> emotionColors = {
    '😊': Colors.yellow,
    '😢': Colors.blue,
    '😡': Colors.red,
    '😴': Colors.grey,
    'Apatia': Colors.purple,
    'Ansiedade': Colors.orange,
  };

  return emotionCounts.entries.map((entry) {
    final index = emotionCounts.keys.toList().indexOf(entry.key);
    return BarChartGroupData(
      x: index,
      barRods: [
        BarChartRodData(
          toY: entry.value.toDouble(),
          color: emotionColors[entry.key] ?? const Color(0xFF81C7C6),
        ),
      ],
    );
  }).toList();
}


  Map<String, int> _countEmotionsByPeriod() {
    final Map<String, int> emotionCounts = {};

    widget.moods.forEach((date, mood) {
      final emotion = mood.split(' ')[0]; 
      if (_isDateInPeriod(date)) {
        emotionCounts[emotion] = (emotionCounts[emotion] ?? 0) + 1;
      }
    });

    return emotionCounts;
  }


  bool _isDateInPeriod(DateTime date) {
    final now = DateTime.now();
    switch (_selectedPeriod) {
      case 'Semana':
        return date.isAfter(now.subtract(const Duration(days: 7)));
      case 'Mês':
        return date.month == now.month && date.year == now.year;
      case 'Ano':
        return date.year == now.year;
      default:
        return false;
    }
  }


  String _getBottomTitle(double value) {
    final emotionCounts = _countEmotionsByPeriod();
    final emotions = emotionCounts.keys.toList();
    if (value.toInt() < emotions.length) {
      return emotions[value.toInt()];
    }
    return '';
  }


  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
     
        if (index == 0) {
          Navigator.pop(context);
        } else if (index == 1) {
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
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 67,
            height: 67,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: index == 1 ? Colors.white.withOpacity(0.2) : Colors.transparent,
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