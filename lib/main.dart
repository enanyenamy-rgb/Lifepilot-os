import 'package:flutter/material.dart';

void main() {
  runApp(const AiPhoneStoreApp());
}

class AiPhoneStoreApp extends StatelessWidget {
  const AiPhoneStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Phone Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PhoneListScreen(),
    );
  }
}

class PhoneModel {
  final String name;
  final String brand;
  final String price;
  final String processor;
  final String battery;
  final String camera;
  final String imageUrl;

  PhoneModel({
    required this.name,
    required this.brand,
    required this.price,
    required this.processor,
    required this.battery,
    required this.camera,
    required this.imageUrl,
  });
}

class PhoneListScreen extends StatefulWidget {
  const PhoneListScreen({super.key});

  @override
  State<PhoneListScreen> createState() => _PhoneListScreenState();
}

class _PhoneListScreenState extends State<PhoneListScreen> {
  final List<PhoneModel> phones = [
    PhoneModel(
      name: 'Poco X8 Pro',
      brand: 'Poco',
      price: '\$350',
      processor: 'Dimensity 8300 Ultra',
      battery: '5000 mAh',
      camera: '64 MP Dual',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    PhoneModel(
      name: 'Honor X9d',
      brand: 'Honor',
      price: '\$400',
      processor: 'Snapdragon 6 Gen 1',
      battery: '5800 mAh',
      camera: '108 MP Triple',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    PhoneModel(
      name: 'Realme GT 6',
      brand: 'Realme',
      price: '\$500',
      processor: 'Snapdragon 8s Gen 3',
      battery: '5500 mAh',
      camera: '50 MP OIS',
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Phone Store - مقارنة الهواتف'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.deepPurple.shade200),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.deepPurple),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'مرحباً بك! تصفح أحدث الهواتف الذكية وقارن المواصفات بدعم الذكاء الاصطناعي.',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'الهواتف المتاحة:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: phones.length,
                itemBuilder: (context, index) {
                  final phone = phones[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      title: Text(
                        phone.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text('الماركة: ${phone.brand} | السعر: ${phone.price}'),
                          Text('المعالج: ${phone.processor}'),
                          Text('البطارية: ${phone.battery}'),
                        ],
                      ),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          // Secure feature simulation example containing escaped dollar sign
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('ميزة الآمان'),
                              content: const Text(
                                'Pay \$1.00 fee to reveal seller phone and WhatsApp securely?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('إلغاء'),
                                ),
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('موافق وادفع'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text('التفاصيل'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
