import 'package:flutter/material.dart';

import '../models/simple_recipe.dart';

class DetailScreen extends StatelessWidget {
  final SimpleRecipe recipe;

  const DetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body:
      Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Hero(
                tag: recipe.title,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    recipe.dishImage,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              recipe.title,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(recipe.duration, style: Theme.of(context).textTheme.bodyLarge),

          ],
        ),
      ),
    );
  }
}

