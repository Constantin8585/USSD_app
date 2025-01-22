import 'package:flutter/material.dart';
import 'package:ussd_app/sim1/sim1_payement.dart';
import 'package:ussd_app/sim2/sim2_paiement.dart';

class PayementPage extends StatefulWidget {
  const PayementPage({super.key});

  @override
  State<PayementPage> createState() => _PayementPageState();
}

class _PayementPageState extends State<PayementPage> {
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
                  MaterialPageRoute(builder: (context) => const sim1Payement()),
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
                  MaterialPageRoute(builder: (context) => const sim2Paiement()),
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
