import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sozluk/services/auth_service.dart';

final authServiceProvider = Provider(
  (_) => AuthService(),
);
