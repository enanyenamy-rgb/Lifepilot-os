import 'package:flutter/material.dart';

void main() {
  runApp(const AiPhoneStoreApp());
}

class AiPhoneStoreApp extends StatelessWidget {
  const AiPhoneStoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Phone Store',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: Colors.blueAccent,
      ),
      home: const StoreHomePage(),
    );
  }
}

class StoreHomePage extends StatelessWidget {
  const StoreHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // قائمة شاملة للهواتف العالمية الذكية
    final List<Map<String, String>> globalPhones = [
      {
        'name': 'iPhone 17 Pro Max',
        'brand': 'Apple',
        'price': '\$1,199',
        'processor': 'Apple A19 Pro (3nm)',
        'battery': '4850 mAh',
        'image': 'https://res.cloudinary.com/j1f5vm0p/image/upload/f_auto,q_auto/sample',
      },
      {
        'name': 'Samsung Galaxy S26 Ultra',
        'brand': 'Samsung',
        'price': '\$1,099',
        'processor': 'Snapdragon 8 Elite',
        'battery': '5000 mAh',
        'image': 'https://res.cloudinary.com/j1f5vm0p/image/upload/f_auto,q_auto/sample',
      },
      {
        'name': 'Xiaomi 16 Ultra AI',
        'brand': 'Xiaomi',
        'price': '\$999',
        'processor': 'Snapdragon 8 Elite',
        'battery': '5300 mAh',
        'image': 'https://res.cloudinary.com/j1f5vm0p/image/upload/f_auto,q_auto/sample',
      },
      {
        'name': 'Honor X9d AI Edition',
        'brand': 'Honor',
        'price': '\$599',
        'processor': 'Snapdragon 6 Gen 3',
        'battery': '5800 mAh',
        'image': 'https://res.cloudinary.com/j1f5vm0p/image/upload/f_auto,q_auto/sample',
      },
      {
        'name': 'Poco X8 Pro Gaming',
        'brand': 'Poco',
        'price': '\$449',
        'processor': 'Dimensity 8400 Ultra',
        'battery': '5000 mAh',
        'image': 'https://res.cloudinary.com/j1f5vm0p/image/upload/f_auto,q_auto/sample',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Phone Store - Global', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color(0xFF1F1F1F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: globalPhones.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // عرض منتجين في كل صف لتصميم احترافي
            childAspectRatio: 0.7,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final phone = globalPhones[index];

            return Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // صورة الهاتف المجلوبة من سحابة Cloudinary
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.network(
                        phone['image']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return const Center(child: CircularProgressIndicator(color: Colors.blueAccent));
                        },
                        errorBuilder: (context, error, stackTrace) => const Center(
                          child: Icon(Icons.phone_android, size: 40, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  // تفاصيل الهاتف
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          phone['name']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${phone['processor']}',
                          style: const TextStyle(color: Colors.grey, fontSize: 10),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.between,
                          children: [
                            Text(
                              phone['price']!,
                              style: const TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'Global',
                                style: TextStyle(color: Colors.blueAccent, fontSize: 9),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
