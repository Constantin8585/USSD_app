import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    if (await FlutterContacts.requestPermission()) {
      final List<Contact> fetchedContacts =
          await FlutterContacts.getContacts(withProperties: true);
      setState(() {
        contacts = fetchedContacts;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Permission refusée pour accéder aux contacts')),
      );
    }
  }

  Future<void> callContact(String phoneNumber) async {
    await FlutterPhoneDirectCaller.callNumber(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des contacts'),
      ),
      body: contacts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                final avatar =
                    contact.thumbnail != null && contact.thumbnail!.isNotEmpty
                        ? Image.memory(contact.thumbnail!,
                            width: 40, height: 40, fit: BoxFit.cover)
                        : const CircleAvatar(child: Icon(Icons.person));
                final phone = contact.phones.isNotEmpty
                    ? contact.phones.first.number
                    : 'Pas de numéro de téléphone';
                return ListTile(
                  leading: avatar,
                  title: Text(contact.displayName ?? 'Nom inconnu'),
                  subtitle: Text(phone),
                  trailing: IconButton(
                    icon: const Icon(Icons.phone),
                    onPressed: () => callContact(phone),
                  ),
                );
              },
            ),
    );
  }
}
