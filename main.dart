import 'package:flutter/material.dart';

void main() {
  runApp(const LifePilotApp());
}

class LifePilotApp extends StatelessWidget {
  const LifePilotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'title': 'سفر ورحلات / Travel', 'icon': Icons.flight, 'color': Colors.orange},
      {'title': 'استشارات طبية / Medical', 'icon': Icons.local_hospital, 'color': Colors.red},
      {'title': 'هندسة وكيمياء / Engineering', 'icon': Icons.science, 'color': Colors.purple},
      {'title': 'سيارات وتجارة / Cars & Business', 'icon': Icons.directions_car, 'color': Colors.blue},
      {'title': 'أفكار وذكاء اصطناعي / AI Ideas', 'icon': Icons.psychology, 'color': Colors.teal},
      {'title': 'المال والأعمال / Finance', 'icon': Icons.attach_money, 'color': Colors.green},
      {'title': 'القوانين والعقود / Laws', 'icon': Icons.gavel, 'color': Colors.brown},
      {'title': 'التغذية والرياضة / Fitness', 'icon': Icons.fitness_center, 'color': Colors.pink},
      {'title': 'التعلم وتطوير الذات / Learning', 'icon': Icons.school, 'color': Colors.indigo},
      {'title': 'الصيانة المنزلية / Home Repair', 'icon': Icons.home_repair_service, 'color': Colors.amber},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('LifePilot OS', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: const Color(0xFF1A365D),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'مرحباً بك، كيف يمكنني مساعدتك اليوم؟\nWelcome, how can I help you today?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1A365D)),
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'اسأل عن أي شيء بلغتِك... / Ask in any language...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Color(0xFF2B6CB0)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
                onSubmitted: (value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(query: value),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'الأقسام الشاملة / Categories',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1A365D)),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(query: 'استفسار في قسم: ${cat['title']}'),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(cat['icon'], color: cat['color']),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            cat['title'],
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF2D3748)),
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final String query;
  const ChatScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LifePilot AI Assistant', style: TextStyle(fontSize: 16, color: Colors.white)),
        backgroundColor: const Color(0xFF1A365D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFF2B6CB0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(query, style: const TextStyle(color: Colors.white)),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Text(
                  'أهلاً بك! بصفتي مساعد LifePilot الذكي، أنا جاهز لتحليل طلبك، تقديم الخطط الدقيقة، والإجابة عن كل استفساراتك بدقة وسرعة في هذا القسم.',
                  style: TextStyle(color: Color(0xFF2D3748), height: 1.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
