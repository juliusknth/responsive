import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import 'grid_configuration.dart';
import 'widgets.dart';

class RootLayout extends StatelessWidget {
  const RootLayout({
    Key? key,
    this.content,
    this.sidebar,
  }) : super(key: key);

  final Widget? content;
  final Widget? sidebar;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      GridConfiguration computeGridConfig() {
        if (constraints.maxWidth >= 840) {
          // Desktop
          return GridConfiguration(
            areas: '''
          nav content
        ''',
            columnSizes: [auto, 1.fr],
            rowSizes: [
              1.fr,
            ],
          );
        } else if (constraints.maxWidth >= 600) {
          // Larger mobile
          return GridConfiguration(
            areas: '''
          nav content
        ''',
            columnSizes: [auto, 1.fr],
            rowSizes: [
              1.fr,
            ],
          );
        } else {
          // Small mobile
          return GridConfiguration(
            areas: '''
          content
          footer
        ''',
            columnSizes: [1.fr],
            rowSizes: [
              1.fr,
              auto,
            ],
          );
        }
      }

      final gridConfig = computeGridConfig();
      return Container(
        color: Colors.grey[400],
        child: LayoutGrid(
          areas: gridConfig.areas,
          // A number of extension methods are provided for concise track sizing
          columnSizes: gridConfig.columnSizes,
          rowSizes: gridConfig.rowSizes,
          children: [
            const Navigation().inGridArea('nav'),
            (content ?? const SizedBox.shrink()).inGridArea('content'),
            if (gridConfig.areas.contains('footer'))
              const Footer().inGridArea('footer'),
          ],
        ),
      );
    });
  }
}
