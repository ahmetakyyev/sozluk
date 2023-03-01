import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sozluk/services/auto_fill_service.dart';

import '../models/auto_fill_model.dart';

class AutoFillNotifier extends ChangeNotifier {
  String _query = "a";

  set query(value) {
    _query = value;
  }

  String get query => _query;

  void listenToAutoFillQuery(String query) {
    _query = query;

    notifyListeners();
  }
}

final autoFillQueryProvider = ChangeNotifierProvider(
  (_) => AutoFillNotifier(),
);

final autoFillProvider = Provider(
  (_) => AutoFillService(),
);

final getAutoFillResponse = FutureProvider.autoDispose
    .family<List<AutoCompleteModel>, String>((ref, query) {
  final res = ref.read(autoFillProvider);
  return res.get(query);
});
