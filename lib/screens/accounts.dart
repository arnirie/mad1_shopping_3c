import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  late final SharedPreferences prefs;
  var usernameController = TextEditingController();
  var fullnameController = TextEditingController();
  var addressController = TextEditingController();

  void fetchData() async {
    prefs = await SharedPreferences.getInstance();
    usernameController.text = prefs.getString('username') ?? '';
    fullnameController.text = prefs.getString('fullname') ?? '';
    addressController.text = prefs.getString('address') ?? '';
  }

  void saveData() async {
    await prefs.setString('username', usernameController.text);
    await prefs.setString('fullname', fullnameController.text);
    await prefs.setString('address', addressController.text);
    print('prefs saved');
  }

  @override
  void initState() {
    fetchData();
    super.initState();
    print('called initstate');
  }

  @override
  Widget build(BuildContext context) {
    print('called build');
    const outlineBorder = InputDecoration(border: OutlineInputBorder());
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        actions: [
          IconButton(
            onPressed: saveData,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Text('Username'),
          Gap(2),
          TextField(
            controller: usernameController,
            decoration: outlineBorder,
          ),
          Gap(8),
          const Text('Fullname'),
          Gap(2),
          TextField(
            controller: fullnameController,
            decoration: outlineBorder,
          ),
          Gap(8),
          const Text('Address'),
          Gap(2),
          TextField(
            controller: addressController,
            decoration: outlineBorder,
            maxLines: 4,
            maxLength: 2000,
          ),
        ],
      ),
    );
  }
}
