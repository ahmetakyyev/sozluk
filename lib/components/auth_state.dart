//@dart=2.9
import 'package:flutter/material.dart';
import 'package:sozluk/screens/home.dart';
import 'package:sozluk/screens/login.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthState<T extends StatefulWidget> extends SupabaseAuthState<T> {
  @override
  void onUnauthenticated() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(flag: true),
      ),
    );
  }

  @override
  void onAuthenticated(Session session) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }

  @override
  void onPasswordRecovery(Session session) {}

  @override
  void onErrorAuthenticating(String message) {
    print('Error authenticating $message');
  }
}
