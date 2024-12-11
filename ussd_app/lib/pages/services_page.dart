import 'package:flutter/material.dart';
import 'package:ussd_app/moov/moov_produit.dart';
import 'package:ussd_app/pages/credit_page.dart';
import 'package:ussd_app/pages/forfait_page.dart';
import 'package:ussd_app/pages/payement_page.dart';
import 'package:ussd_app/pages/transfert_page.dart';
import 'package:ussd_app/togocom/togocom_produits.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          _buildServiceCard(
            context,
            color: Colors.orange[400]!,
            icon: Icons.credit_card,
            text: 'Transfert de CREDIT',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreditPage()),
            ),
          ),
          _buildServiceCard(
            context,
            color: Colors.blue[400]!,
            icon: Icons.phone_android,
            text: 'FORFAITS',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ForfaitPage()),
            ),
          ),
          _buildServiceCard(
            context,
            color: Colors.green[400]!,
            icon: Icons.payment,
            text: 'PAIEMENT',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PayementPage()),
            ),
          ),
          _buildServiceCard(
            context,
            color: Colors.orange[400]!,
            icon: Icons.swap_horiz,
            text: 'TRANSFERT d\'argent',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TransfertPage()),
            ),
          ),
          _buildServiceCard(
            context,
            color: Colors.blue[400]!,
            icon: Icons.swap_horiz,
            text: 'crédit/forfait FLOOZ',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MoovProduits()),
            ),
          ),
          _buildServiceCard(
            context,
            color: Colors.green[400]!,
            icon: Icons.swap_horiz,
            text: 'crédit/forfait TMONEY',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TogocomProduits()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context,
      {required Color color,
      required IconData icon,
      required String text,
      Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color,
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(text, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
