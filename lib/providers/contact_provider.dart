import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddies/database/database_helper.dart';

final contactsProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final dbHelper = DatabaseHelper();
  return await dbHelper.getContacts();
});
