  import 'package:flutter/material.dart';
  import '../api/mock_fooderlich_service.dart';
  import '../components/components.dart';
  import '../models/explore_data.dart';

  class ExploreScreen extends StatefulWidget {
    const ExploreScreen({super.key});

    @override
    State<ExploreScreen> createState() => _ExploreScreenState();
  }

  class _ExploreScreenState extends State<ExploreScreen> {
    final mockService = MockFooderlichService();
    final ScrollController _scrollController = ScrollController();

    @override
    void initState() {
      super.initState();

      _scrollController.addListener(() {
        // Detect when scrolled to the bottom
        if (_scrollController.position.pixels <= 0) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text("You've reached the top!")),
          // );
          print('i am at the top');
        }
        else if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
          print('i am at the bottom!');
          // You can trigger pagination or animations here
        }

      });
    }

    @override
    void dispose() {
      _scrollController.dispose(); // Always dispose controller
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final data = snapshot.data as ExploreData;
              final recipes = data.todayRecipes;
              final friendposts = data.friendPosts;

              return ListView(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                children: [
                  TodayRecipeListView(recipes: recipes),
                  const SizedBox(height: 16),
                  FriendPostListView(friendPosts: friendposts),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return const Center(child: Text('No data available'));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
    }
  }
