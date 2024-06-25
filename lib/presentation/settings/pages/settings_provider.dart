import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>((ref) => DarkModeNotifier());
final weightProvider = StateNotifierProvider<WeightNotifier, String>((ref) => WeightNotifier());
final heightProvider = StateNotifierProvider<HeightNotifier, String>((ref) => HeightNotifier());
final ageProvider = StateNotifierProvider<AgeNotifier, String>((ref) => AgeNotifier());

class DarkModeNotifier extends StateNotifier<bool> {
  DarkModeNotifier() : super(false) {
    _loadFromPrefs();
  }

  void _loadFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = prefs.getBool('darkMode') ?? false;
  }

  void toggle(bool isOn) async {
    state = isOn;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', isOn);
  }
}

class WeightNotifier extends StateNotifier<String> {
  WeightNotifier() : super('') {
    _loadFromPrefs();
  }

  void _loadFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = prefs.getString('weight') ?? '';
  }

  void setWeight(String weight) async {
    state = weight;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('weight', weight);
  }
}

class HeightNotifier extends StateNotifier<String> {
  HeightNotifier() : super('') {
    _loadFromPrefs();
  }

  void _loadFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = prefs.getString('height') ?? '';
  }

  void setHeight(String height) async {
    state = height;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('height', height);
  }
}

class AgeNotifier extends StateNotifier<String> {
  AgeNotifier() : super('') {
    _loadFromPrefs();
  }

  void _loadFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = prefs.getString('age') ?? '';
  }

  void setAge(String age) async {
    state = age;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('age', age);
  }
}
