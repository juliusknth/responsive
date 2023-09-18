import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive/responsive_layout.dart';

import 'home_screen.dart';
import 'root_layout.dart';
import 'user_details.dart';
import 'user_list.dart';
import 'widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            body: RootLayout(
              content: child,
            ),
          );
        },
        routes: [
          ShellRoute(
            builder: (context, state, child) {
              return ResponsiveLayout(
                content: const UsersList(),
                sidebar: child,
                state: state,
              );
            },
            routes: [
              GoRoute(
                name: 'users-list',
                path: '/users',
                builder: (context, state) => const Sidebar(),
                routes: [
                  GoRoute(
                    name: 'user-details',
                    path: ':id',
                    builder: (context, state) {
                      final id = state.pathParameters['id'];
                      return Scaffold(
                        appBar: AppBar(
                          title: Text(
                            'User $id',
                          ),
                          backgroundColor: Colors.deepPurple,
                        ),
                        body: UserDetails(id: id!),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Go Router Demo',
    );
  }
}
