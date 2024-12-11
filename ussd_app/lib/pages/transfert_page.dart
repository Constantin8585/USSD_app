import 'package:flutter/material.dart';
import 'package:ussd_app/moov/moov_transfert.dart';
import 'package:ussd_app/togocom/togocom_transfert.dart';

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
                      builder: (context) => const MoovTransfert()),
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
                      builder: (context) => const TogocomTransfert()),
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
