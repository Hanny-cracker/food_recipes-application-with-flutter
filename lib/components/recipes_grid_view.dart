import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../screens/detail_screen.dart';

class RecipesGridView extends StatelessWidget {
  // 1
  final List<SimpleRecipe> recipes;

  const RecipesGridView({Key? key, required this.recipes}) : super(key:
  key);

  @override
  Widget build(BuildContext context) {
    // 2
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top:
        16),
        // 3
        child:
        GridView.builder(
          itemCount: recipes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(recipe: recipe),
                  ),
                );
              },
              child: RecipeThumbnail(recipe: recipe),
            );
          },
        )

    );
  }
}