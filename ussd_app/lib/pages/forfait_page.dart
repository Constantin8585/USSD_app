import 'package:flutter/material.dart';
import 'package:ussd_app/moov/moov_forfaits.dart';
import 'package:ussd_app/togocom/togcom_forfaits.dart';

class ForfaitPage extends StatefulWidget {
  const ForfaitPage({super.key});

  @override
  State<ForfaitPage> createState() => _ForfaitPageState();
}

class _ForfaitPageState extends State<ForfaitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Veillez choisir votre service téléphonique'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MoovForfaits()),
                );
              },
              child: Image.asset(
                'assets/images/moov.png',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TogcomForfaits()),
                );
              },
              child: Image.asset(
                'assets/images/yas.jpeg',
                width: 200,
                height: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
