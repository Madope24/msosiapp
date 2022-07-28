import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:order/screens/categories_screen.dart';
import 'package:order/screens/favourites_screen.dart';
import 'package:order/widgets/main_drawer.dart';
import 'package:order/meal.dart';
class TabsScreen extends StatefulWidget {
  //const TabsScreen({Key? key}) : super(key: key);
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String,Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages =  = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavouritesScreen(widget.favoriteMeals), 'title': 'Your Favourites'},
    ];

    super.initState();
  }


  void _selectPage(int index){
     setState(() {
       _selectedPageIndex = index;
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],

      bottomNavigationBar: BottomNavigationBar(
        onTap:_selectPage,

        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedPageIndex,

        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
             icon: Icon(Icons.category),
             title: Text('Categories'),
    ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
             icon: Icon(Icons.star),
             title: Text('Favourites'),
     ),

    ],
    ),
    );


  }
}
