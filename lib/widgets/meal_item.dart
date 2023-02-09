import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routeName, arguments: id)
        .then((result) {
      if (result != null) {
        //removeitem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(imageUrl,
                    height: 250, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                bottom: 100,
                child: Container(
                  width: 400,
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Center(
                    child: Text(title,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        style: const TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                            letterSpacing: 1),
                        '$duration Minutes',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      PreferredSize(
                          preferredSize: const Size.fromHeight(1.0),
                          child: Container(
                            color: Colors.grey,
                            height: 50,
                            width: 2,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work, color: Colors.amber),
                      const SizedBox(width: 6),
                      Text(
                        style: const TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 1,
                          fontSize: 16,
                        ),
                        complexityText,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      PreferredSize(
                        preferredSize: const Size.fromHeight(1.0),
                        child: Container(
                          color: Colors.grey,
                          height: 50,
                          width: 2,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      children: [
                        const Icon(Icons.attach_money_sharp,
                            color: Colors.amber),
                        const SizedBox(width: 1),
                        Text(
                          style: const TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 1,
                              fontSize: 16),
                          affordabilityText,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ]),
          )
        ]),
      ),
    );
  }
}
