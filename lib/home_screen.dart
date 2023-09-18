import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // get the GoRouter object from the context
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the home screen'),
            ElevatedButton(
              onPressed: () {
                // navigate to the users screen using the name of the route
                context.go('/users');
              },
              child: const Text('Go to users'),
            ),
          ],
        ),
      ),
    );
  }
}
