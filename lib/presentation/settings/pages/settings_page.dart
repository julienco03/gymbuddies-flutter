import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'settings_provider.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  late TextEditingController weightController;
  late TextEditingController heightController;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    weightController = TextEditingController();
    heightController = TextEditingController();
    ageController = TextEditingController();
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = ref.watch(darkModeProvider);
    final weight = ref.watch(weightProvider);
    final height = ref.watch(heightProvider);
    final age = ref.watch(ageProvider);

    weightController.text = weight;
    heightController.text = height;
    ageController.text = age;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
              title: const Text('Dark Mode',
              style: TextStyle(color: Colors.white)),
              value: darkMode,
              onChanged: (bool value) {
                ref.read(darkModeProvider.notifier).toggle(value);
              },
            ),
            TextField(
              controller: weightController,
              decoration: const InputDecoration(labelText: 'Weight (kg)', labelStyle: TextStyle(color: Colors.white)),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                ref.read(weightProvider.notifier).setWeight(value);
              },
            ),
            TextField(
              controller: heightController,
              decoration: const InputDecoration(labelText: 'Height (cm)', labelStyle: TextStyle(color: Colors.white)),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                ref.read(heightProvider.notifier).setHeight(value);
              },
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Age', labelStyle: TextStyle(color: Colors.white)),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                ref.read(ageProvider.notifier).setAge(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
