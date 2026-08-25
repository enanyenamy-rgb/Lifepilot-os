import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // سنحتاج لهذه المكتبة للأيقونات الحديثة

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
        // نستخدم نظام ألوان Material 3 حديث
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6200EE)),
        useMaterial3: true,
        fontFamily: 'Cairo', // نفترض خط عربي جميل مثل Cairo
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
  final IconData brandIcon; // أيقونة حديثة للعلامة التجارية

  PhoneModel({
    required this.name,
    required this.brand,
    required this.price,
    required this.processor,
    required this.battery,
    required this.camera,
    required this.brandIcon,
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
      brand: 'Xiaomi Poco',
      price: '\$350',
      processor: 'Dimensity 8300 Ultra',
      battery: '5000 mAh',
      camera: '64 MP AI Dual',
      brandIcon: FontAwesomeIcons.mobileScreen, // أيقونة عامة للهواتف، يمكن استبدالها بشعار Poco إن وجد
    ),
    PhoneModel(
      name: 'Honor X9d',
      brand: 'Honor',
      price: '\$400',
      processor: 'Snapdragon 6 Gen 1',
      battery: '5800 mAh',
      camera: '108 MP Triple',
      brandIcon: FontAwesomeIcons.gem, // أيقونة تعبر عن فخامة السلسلة X
    ),
    PhoneModel(
      name: 'Realme GT 6',
      brand: 'Realme',
      price: '\$500',
      processor: 'Snapdragon 8s Gen 3',
      battery: '5500 mAh',
      camera: '50 MP OIS Sony',
      brandIcon: FontAwesomeIcons.bolt, // أيقونة تعبر عن السرعة (GT)
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // شريط علوي بتدرج لوني حديث (Gradient)
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6200EE), Color(0xFFBB86FC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Row(
          children: [
            FaIcon(FontAwesomeIcons.robot, color: Colors.white, size: 24),
            SizedBox(width: 12),
            Text(
              'متجر هواتف الذكاء الاصطناعي',
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey.shade50, // خلفية فاتحة ونظيفة
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بطاقة الترحيب الحديثة
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const FaIcon(FontAwesomeIcons.circleInfo,
                        color: Color(0xFF6200EE), size: 32),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'أهلاً بك!',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF6200EE)),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'تصفح أحدث الهواتف الذكية وقارن المواصفات بدعم الذكاء الاصطناعي.',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'الهواتف المميزة المتاحة:',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: phones.length,
                itemBuilder: (context, index) {
                  final phone = phones[index];
                  // بطاقة الهاتف الحديثة بتفاصيل غنية
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    elevation: 4,
                    shadowColor: Colors.black26,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // أيقونة الماركة
                          CircleAvatar(
                            backgroundColor:
                                const Color(0xFF6200EE).withOpacity(0.1),
                            radius: 28,
                            child: FaIcon(phone.brandIcon,
                                color: const Color(0xFF6200EE), size: 28),
                          ),
                          const SizedBox(width: 16),
                          // تفاصيل الهاتف
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        phone.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black87,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    // السعر بشكل بارز
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade100,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        phone.price,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.green.shade800,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                // تفاصيل المواصفات بأيقونات صغيرة
                                _buildSpecRow(
                                    FontAwesomeIcons.microchip, phone.processor),
                                const SizedBox(height: 4),
                                _buildSpecRow(
                                    FontAwesomeIcons.batteryFull, phone.battery),
                                const SizedBox(height: 4),
                                _buildSpecRow(
                                    FontAwesomeIcons.camera, phone.camera),
                                const SizedBox(height: 16),
                                // زر التفاصيل الحديث
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF6200EE),
                                      foregroundColor: Colors.white,
                                      elevation: 4,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () {
                                      // محاكاة ميزة الآمان مع الـ Escape لرمز الدولار
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text('ميزة الآمان المتقدمة'),
                                          content: const Text(
                                            'Pay \$1.00 fee to reveal seller phone and WhatsApp securely?',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('إلغاء'),
                                            ),
                                            ElevatedButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child:
                                                  const Text('تأكيد الدفع وفتح البيانات'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    icon: const FaIcon(FontAwesomeIcons.circleInfo,
                                        size: 18),
                                    label: const Text('عرض التفاصيل الكاملة'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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

  // دالة مساعدة لبناء صف المواصفات بشكل موحد
  Widget _buildSpecRow(IconData icon, String text) {
    return Row(
      children: [
        FaIcon(icon, size: 14, color: Colors.grey.shade600),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
          ),
        ),
      ],
    );
  }
}
