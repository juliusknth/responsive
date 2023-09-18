import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:go_router/go_router.dart';

import 'grid_configuration.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    this.content,
    this.sidebar,
    required this.state,
  }) : super(key: key);

  final Widget? content;
  final Widget? sidebar;
  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      GridConfiguration computeGridConfig() {
        if (constraints.maxWidth >= 840) {
          return GridConfiguration(
            areas: '''
          content sidebar
        ''',
            columnSizes: [1.fr, 2.fr],
            rowSizes: [
              1.fr,
            ],
          );
        } else if (constraints.maxWidth >= 600) {
          return GridConfiguration(
            areas: '''
          content sidebar
        ''',
            columnSizes: [1.fr, 2.fr],
            rowSizes: [
              1.fr,
            ],
          );
        } else if (state.pathParameters.isEmpty) {
          return GridConfiguration(
            areas: '''
          sidebar
          content
        ''',
            columnSizes: [1.fr],
            rowSizes: [
              1.fr,
              2.fr,
            ],
          );
        } else {
          return GridConfiguration(
            areas: '''
          content
        ''',
            columnSizes: [1.fr],
            rowSizes: [
              1.fr,
            ],
          );
        }
      }

      final gridConfig = computeGridConfig();

      return Container(
        color: Colors.grey[400],
        child: LayoutGrid(
          areas: gridConfig.areas,
          columnSizes: gridConfig.columnSizes,
          rowSizes: gridConfig.rowSizes,
          children: [
            (content ?? const SizedBox.shrink()).inGridArea('content'),
            if (gridConfig.columnSizes.length == 1 &&
                state.pathParameters.isNotEmpty)
              (sidebar ?? const SizedBox.shrink()).inGridArea('content'),
            if (gridConfig.columnSizes.length == 1 &&
                state.pathParameters.isEmpty)
              (sidebar ?? const SizedBox.shrink()).inGridArea('sidebar'),
            if (gridConfig.columnSizes.length > 1)
              (sidebar ?? const SizedBox.shrink()).inGridArea('sidebar'),
          ],
        ),
      );
    });
  }
}
