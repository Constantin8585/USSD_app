import 'package:flutter/material.dart';

class TogocomPaiement extends StatefulWidget {
  const TogocomPaiement({super.key});

  @override
  State<TogocomPaiement> createState() => _TogocomPaiementState();
}

class _TogocomPaiementState extends State<TogocomPaiement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payement de facture avec Togocom "),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListTile(
                leading: const Icon(
                  Icons.credit_card,
                  color: Colors.black,
                ),
                onTap: () {},
                title: const Text(
                  'Facture CEET(Normale)',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListTile(
                leading: const Icon(
                  Icons.credit_card,
                  color: Colors.black,
                ),
                onTap: () {},
                title: const Text(
                  'Facture CEET(Impayée)',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListTile(
                leading: const Icon(
                  Icons.credit_card,
                  color: Colors.black,
                ),
                onTap: () {},
                title: const Text(
                  'CASH POWER',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListTile(
                leading: const Icon(
                  Icons.credit_card,
                  color: Colors.black,
                ),
                onTap: () {},
                title: const Text(
                  'Reabonnement Canal Box',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: ListTile(
                leading: Icon(
                  Icons.credit_card,
                  color: Colors.black,
                ),
                title: Text(
                  'Reabonnement Canal +',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListTile(
                leading: const Icon(
                  Icons.credit_card,
                  color: Colors.black,
                ),
                onTap: () {},
                title: const Text(
                  'Reabonnement New World TV',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListTile(
                leading: const Icon(
                  Icons.credit_card,
                  color: Colors.black,
                ),
                onTap: () {},
                title: const Text(
                  'Facture Tde',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
