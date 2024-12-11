import 'package:flutter/material.dart';
import 'package:ussd_app/moov/moov_forfait_internet.dart';
import 'package:ussd_app/moov/moov_forfait_mixte.dart';
import 'package:ussd_app/moov/moov_forfait_voie.dart';

class MoovProduits extends StatefulWidget {
  const MoovProduits({super.key});

  @override
  State<MoovProduits> createState() => _MoovForfaitsState();
}

class _MoovForfaitsState extends State<MoovProduits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Veuillez choisir votre Produit"),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _buildForfaitOption(
                context,
                icon: Icons.phone_android_outlined,
                text: 'Recharge de Crédit',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MoovForfaitVoie()),
                ),
              ),
              _buildForfaitOption(
                context,
                icon: Icons.phone_android_outlined,
                text: 'Forfait Appel (voie)',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MoovForfaitVoie()),
                ),
              ),
              _buildForfaitOption(
                context,
                icon: Icons.phone_android_outlined,
                text: 'Forfait Appel (mixte)',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MoovForfaitMixte()),
                ),
              ),
              _buildForfaitOption(
                context,
                icon: Icons.language,
                text: 'Forfait Internet',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MoovForfaitInternet()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForfaitOption(BuildContext context,
      {required IconData icon,
      required String text,
      required Function() onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            leading: Icon(icon, color: Colors.black),
            title: Text(text, style: const TextStyle(color: Colors.black)),
          ),
        ),
      ),
    );
  }
}
