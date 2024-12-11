import 'package:flutter/material.dart';
import 'package:ussd_app/moov/moov_credit.dart';
import 'package:ussd_app/togocom/togocom_credit.dart';

class CreditPage extends StatefulWidget {
  const CreditPage({super.key});

  @override
  State<CreditPage> createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {
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
                  MaterialPageRoute(builder: (context) => const MoovCredit()),
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
                      builder: (context) => const TogocomCredit()),
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
