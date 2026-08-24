import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
                      builder: (context) => ChatScreen(userQuery: value),
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
                          builder: (context) => ChatScreen(userQuery: 'أريد استشارة متخصصة في قسم: ${cat['title']}'),
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

class ChatScreen extends StatefulWidget {
  final String userQuery;
  const ChatScreen({super.key, required this.userQuery});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _messages.add({'role': 'user', 'text': widget.userQuery});
    _getAiResponse(widget.userQuery);
  }

  Future<void> _getAiResponse(String prompt) async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));
    String aiReply = 'مرحباً! بصفتي مساعد LifePilot OS الذكي، تحليلي لطلبك ("$prompt") هو تقديم حلول دقيقة ومفصلة تدعم نجاحك الشخصي والمهني.';

    setState(() {
      _messages.add({'role': 'ai', 'text': aiReply});
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LifePilot AI Assistant', style: TextStyle(fontSize: 16, color: Colors.white)),
        backgroundColor: const Color(0xFF1A365D),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isUser = msg['role'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? const Color(0xFF2B6CB0) : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: isUser ? null : Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      msg['text']!,
                      style: TextStyle(color: isUser ? Colors.white : const Color(0xFF2D3748), height: 1.4),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: LinearProgressIndicator(color: Color(0xFF2B6CB0)),
            ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.grey.shade100,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'اكتب رسالتك هنا... / Type your message...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF1A365D)),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      String text = _controller.text;
                      setState(() {
                        _messages.add({'role': 'user', 'text': text});
                        _controller.clear();
                      });
                      _getAiResponse(text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
