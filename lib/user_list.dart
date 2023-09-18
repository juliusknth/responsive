import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    // get the GoRouter object from the context
    return Container(
      color: Colors.green,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          // generate some dummy user names
          final name = 'User ${index + 1}';
          return ListTile(
            title: Text(name),
            onTap: () {
              // navigate to the user screen using the path of the route and passing the id parameter
              context.go('/users/${index + 1}');
            },
          );
        },
      ),
    );
  }
}
