import 'package:flutter/material.dart';
import 'global_phones_service.dart';

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
      theme: ThemeData.dark(),
      home: const AiPhoneStoreHomePage(),
    );
  }
}

class AiPhoneStoreHomePage extends StatelessWidget {
  const AiPhoneStoreHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phones = GlobalPhonesService.getAllGlobalPhones();

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Phone Store - Global'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: ListView.builder(
        itemCount: phones.length,
        itemBuilder: (context, index) {
          final phone = phones[index];
          final imageUrl = GlobalPhonesService.getCloudinaryImageUrl(phone.imageId);

          return Card(
            margin: const EdgeInsets.all(10),
            color: Colors.grey[900],
            child: ListTile(
              leading: Image.network(
                imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.phone_android, color: Colors.white),
              ),
              title: Text(
                phone.name,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Brand: ${phone.brand}\nProcessor: ${phone.processor}',
                style: const TextStyle(color: Colors.white70),
              ),
              trailing: Text(
                phone.price,
                style: const TextStyle(color: Colors.greenAccent, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
