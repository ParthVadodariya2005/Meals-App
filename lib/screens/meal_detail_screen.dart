import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';
  final Function toggleFavorite;
  final Function isFavorite;

  const MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.horizontal()),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 230,
      width: 300,
      child: child,
    );
  }

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.only(right: 20),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    final mealid = ModalRoute.of(context)?.settings.arguments as String;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedmeal.title),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              height: 1,
              color: Colors.grey,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: 450,
              child: Hero(
                tag: mealid,
                child: Image.network(
                  selectedmeal.imageUrl,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            buildSectionTitle(context, 'Ingrediants 😍'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      selectedmeal.ingredients[index],
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
                itemCount: selectedmeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps 😋'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    const Divider(
                      color: Colors.black,
                    ),
                    // tu maan meri jaan main tujhe jaane na dunga.
                    ListTile(
                      leading: CircleAvatar(child: Text('${(index + 1)}')),
                      title: Text(
                        selectedmeal.steps[index],
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                itemCount: selectedmeal.steps.length,
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(mealid),
        child: Icon(isFavorite(mealid) ? Icons.favorite : Icons.favorite_border,
            fill: 1.0, color: Colors.pink),
      ),
    );
  }
}
