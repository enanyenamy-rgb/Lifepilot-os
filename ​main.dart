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
        actions: [
          IconButton(
            icon: const Icon(Icons.star, color: Colors.amber),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaywallScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بطاقة الترقية للأرباح
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF1A365D), Color(0xFF2B6CB0)]),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('الباقة الشاملة Pro', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 5),
                        Text('احصل على استشارات بلا حدود لكل الأقسام', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PaywallScreen()));
                    },
                    child: const Text('ترقية', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
                  BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 2, blurRadius: 8, offset: const Offset(0, 3)),
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
                    MaterialPageRoute(builder: (context) => ChatScreen(userQuery: value)),
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
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: ListTile(
                    leading: Icon(cat['icon'], color: cat['color']),
                    title: Text(cat['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF2D3748))),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatScreen(userQuery: 'أريد استشارة متخصصة في قسم: ${cat['title']}')),
                      );
                    },
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

// شاشة المحادثة مع نظام عداد الرسائل المجانية (محدد بـ 7 رسائل)
class ChatScreen extends StatefulWidget {
  final String userQuery;
  const ChatScreen({super.key, required this.userQuery});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  static int freeMessagesCount = 7; // تم التعديل إلى 7 رسائل مجانية
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
    if (freeMessagesCount <= 0) {
      // إذا انتهت الرسائل المجانية، يتم توجيه المستخدم لصفحة الدفع
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PaywallScreen()));
      return;
    }

    setState(() {
      _isLoading = true;
      freeMessagesCount--; // خصم رسالة من الرصيد المجاني
    });

    await Future.delayed(const Duration(seconds: 1));
    String aiReply = 'مرحباً! بصفتي مساعد LifePilot OS الذكي، تحليلي لطلبك ("$prompt") هو تقديم حلول دقيقة ومفصلة. (الرسائل المجانية المتبقية: $freeMessagesCount)';

    setState(() {
      _messages.add({'role': 'ai', 'text': aiReply});
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Assistant (متبقي: $freeMessagesCount)', style: const TextStyle(fontSize: 14, color: Colors.white)),
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
                      hintText: 'اكتب رسالتك هنا...',
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

// شاشة الاشتراك المدفوع (Paywall) لتحقيق الأرباح
class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ترقية حسابك / Go Pro', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1A365D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.workspace_premium, size: 80, color: Colors.amber),
            const SizedBox(height: 20),
            const Text(
              'انتهى رصيد رسائلك المجانية\nYour free trial has ended',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1A365D)),
            ),
            const SizedBox(height: 10),
            const Text(
              'اشترك الآن في باقة LifePilot Pro واحصل على وصول غير محدود لجميع الأقسام والخبراء واجعل إنتاجيتك بلا حدود.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, height: 1.5),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2B6CB0),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('سيتم ربط بوابة الدفع قريباً لتفعيل الأرباح!')),
                );
              },
              child: const Text('اشتراك شهري ($9.99)', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
