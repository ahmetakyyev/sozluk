import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/bookmark_service.dart';

final bookMarkProvider = Provider(
  (_) => BookMarkService(),
);
