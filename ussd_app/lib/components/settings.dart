import 'package:flutter/material.dart';
import 'package:mobile_number/mobile_number.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _sim1Number = '';
  String _sim1Operator = '';
  String _sim2Number = '';
  String _sim2Operator = '';

  @override
  void initState() {
    super.initState();
    _getSimInfo();
  }

  Future<void> _getSimInfo() async {
    try {
      if (await MobileNumber.hasPhonePermission ?? false) {
        List<SimCard> simCards = await MobileNumber.getSimCards ?? [];
        setState(() {
          if (simCards.isNotEmpty) {
            _sim1Number = simCards[0].number!;
            _sim1Operator = simCards[0].carrierName!;
          }
          if (simCards.length > 1) {
            _sim2Number = simCards[1].number!;
            _sim2Operator = simCards[1].carrierName!;
          }
        });
      }
    } catch (e) {
      print("Erreur lors de la récupération des informations SIM : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text('SIM 1: $_sim1Number'),
              subtitle: Text('Opérateur: $_sim1Operator'),
            ),
            ListTile(
              title: Text('SIM 2: $_sim2Number'),
              subtitle: Text('Opérateur: $_sim2Operator'),
            ),
          ],
        ),
      ),
    );
  }
}
