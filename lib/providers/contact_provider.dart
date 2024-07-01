import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddies/database/database_helper.dart';

final databaseHelperProvider = Provider<DatabaseHelper>((ref) {
  return DatabaseHelper();
});

final contactsProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final dbHelper = ref.read(databaseHelperProvider);
  return await dbHelper.getContacts();
});
