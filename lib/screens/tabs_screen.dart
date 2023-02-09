import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../widgets/main_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Meals App'},
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorites'
      },
    ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        iconSize: 25,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
          fontStyle: FontStyle.italic,
          fontSize: 15,
          //fontFamily: 'MaterialIcons'
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
          fontStyle: FontStyle.italic,
          fontSize: 15,
          //fontFamily: 'MaterialIcons'
        ),
        //elevation: 1,
        backgroundColor: Colors.black,
        //surfaceTintColor: Theme.of(context).secondaryHeaderColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.cyan,
              icon: Icon(
                Icons.category,
                color: Colors.lime,
                weight: 900,
                fill: 1,
              ),
              label: 'Categories'),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(
              Icons.favorite,
              weight: 900,
              color: Colors.pink,
              fill: 1,
              grade: BorderSide.strokeAlignInside,
              size: 25,
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
