import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color.withOpacity(0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(title, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
