import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 3.0;
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Colors.green,
          child: const Text(
            'Cooking up !',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white),
          ),
        ),
        const Divider(height: 1, color: Colors.grey),
        const SizedBox(height: 10),
        //const SizedBox(height: 20),
        buildListTile('Meals', Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        Column(
          children: const [Divider(height: 20, color: Colors.grey)],
        ),
        buildListTile('Filters', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        }),
        Column(
          children: const [Divider(height: 20, color: Colors.grey)],
        )
      ],
    ));
  }
}
