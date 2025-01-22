import 'package:flutter/material.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:permission_handler/permission_handler.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _sim1Number = 'Inconnu';
  String _sim1Operator = 'Inconnu';
  String _sim2Number = 'Inconnu';
  String _sim2Operator = 'Inconnu';

  @override
  void initState() {
    super.initState();
    requestPermissions().then((_) => _getSimInfo());
  }

  Future<void> requestPermissions() async {
    var status = await Permission.phone.status;
    if (!status.isGranted) {
      await Permission.phone.request();
    }
  }

  Future<void> _getSimInfo() async {
    try {
      if (await MobileNumber.hasPhonePermission) {
        List<SimCard>? simCards = await MobileNumber.getSimCards;
        setState(() {
          if (simCards != null && simCards.isNotEmpty) {
            _sim1Number = simCards[0].number ?? 'Inconnu';
            _sim1Operator = simCards[0].carrierName ?? 'Inconnu';
          }
          if (simCards != null && simCards.length > 1) {
            _sim2Number = simCards[1].number ?? 'Inconnu';
            _sim2Operator = simCards[1].carrierName ?? 'Inconnu';
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
