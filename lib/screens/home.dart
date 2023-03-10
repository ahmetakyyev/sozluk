//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sozluk/screens/saved_words.dart';
import 'package:sozluk/screens/search_screen.dart';

import '../providers/home_screen_provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final index = watch(indexProvider);
      List<Widget> _screens = [
        SearchScreen(),
        SavedWords(),
      ];
      return Scaffold(
        body: _screens[index.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index.currentIndex,
          onTap: (val) {
            index.listenToIndex(val);
            print(index.currentIndex);
          },
          backgroundColor: Theme.of(context).accentColor,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).indicatorColor,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_added_rounded),
              label: 'Saved Words',
            ),
          ],
        ),
      );
    });
  }
}
