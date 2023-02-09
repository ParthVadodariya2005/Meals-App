import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    //...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title']!;
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              height: 1,
              color: Colors.grey,
            )),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
