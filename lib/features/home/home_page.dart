import 'package:flutter/material.dart';
import 'package:sea_submission/features/auth/presentation/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    const services = [
      'Haircuts and Styling',
      'Manicure and Pedicure',
      'Facial Treatments'
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('SEA Salon'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          const Text(
            'Beauty and Elegance Redefined',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) =>
                  ItemService(service: services[index]),
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemCount: services.length,
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage())),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    width: 2,
                    color: color.primary,
                  ),
                ),
                shadowColor: color.inversePrimary,
                padding: const EdgeInsets.all(12),
              ),
              child: const Text(
                'Login Here',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'),
                  ),
                ],
                content: const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thomas: 08123456789',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Sekar: 08164829372',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                contentPadding: const EdgeInsets.all(16),
                title: const Text(
                  'Our Contact Person',
                  textAlign: TextAlign.center,
                ),
                titlePadding: const EdgeInsets.all(16),
              ),
            ),
            child: const Text(
              'Contact Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class ItemService extends StatelessWidget {
  const ItemService({
    super.key,
    required this.service,
  });

  final String service;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color.primary,
      ),
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Text(
          service,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
