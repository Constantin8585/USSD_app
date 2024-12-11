import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';

class TogocomForfaitMixte extends StatefulWidget {
  const TogocomForfaitMixte({super.key});

  @override
  State<TogocomForfaitMixte> createState() => _MoovForfaitVoieState();
}

class _MoovForfaitVoieState extends State<TogocomForfaitMixte> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String _selectedCountryCode = '+228';
  String _selectedOption = 'Moi';

  final List<String> _countryCodes = ['+228', '+229', '+233', '+234'];
  final List<String> _options = ['Moi', 'Autre'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yas Forfaits Internet'),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.person, color: Colors.green),
                              SizedBox(width: 10),
                              Text(
                                'Pour qui est ce forfait?',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: _options.map((option) {
                              return Expanded(
                                child: ListTile(
                                  title: Text(option),
                                  leading: Radio<String>(
                                    value: option,
                                    groupValue: _selectedOption,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedOption = value!;
                                        if (_selectedOption == 'Moi') {
                                          _numberController.text =
                                              'MyNumber'; // Replace with the user's actual number
                                        } else {
                                          _numberController.clear();
                                        }
                                      });
                                    },
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_selectedOption == 'Autre')
                    Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.phone, color: Colors.green),
                                SizedBox(width: 10),
                                Text(
                                  'Numéro du Bénéficiaire',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  value: _selectedCountryCode,
                                  items: _countryCodes
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedCountryCode = newValue!;
                                    });
                                  },
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextFormField(
                                    controller: _numberController,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      hintText: 'Entrez le numéro',
                                      suffixIcon: IconButton(
                                        icon: const Icon(Icons.search),
                                        onPressed: _pickContact,
                                      ),
                                    ),
                                    keyboardType: TextInputType.phone,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Veuillez entrer le numéro du bénéficiaire';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.attach_money, color: Colors.green),
                              SizedBox(width: 10),
                              Text(
                                'Montant du forfait',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _amountController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Entrez le montant',
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez entrer le montant à envoyer';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'CFA',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Process the transaction here
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Transaction confirmée')),
                            );
                          }
                        },
                        icon: const Icon(Icons.check),
                        label: const Text('Confirmer'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          _formKey.currentState!.reset();
                          _numberController.clear();
                          _amountController.clear();
                        },
                        icon: const Icon(Icons.cancel),
                        label: const Text('Annuler'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickContact() async {
    try {
      final PhoneContact contact =
          await FlutterContactPicker.pickPhoneContact();
      setState(() {
        _numberController.text = contact.phoneNumber?.number ?? '';
      });
    } catch (e) {
      if (e is UserCancelledPickingException) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sélection de contact annulée')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Erreur lors de la sélection du contact')),
        );
      }
    }
  }
}
