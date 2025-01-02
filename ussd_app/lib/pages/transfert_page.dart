import 'package:flutter/material.dart';
import 'package:ussd_app/sim1/sim1_transfert.dart';
import 'package:ussd_app/sim2/sim2_transfert.dart';

class TransfertPage extends StatefulWidget {
  const TransfertPage({super.key});

  @override
  State<TransfertPage> createState() => _ForfaitPageState();
}

class _ForfaitPageState extends State<TransfertPage> {
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
                  MaterialPageRoute(
                      builder: (context) => const sim1Transfert()),
                );
              },
              child: Image.asset(
                'assets/images/sim1.png',
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
                      builder: (context) => const sim2Transfert()),
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
