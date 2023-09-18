import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class GridConfiguration {
  String areas;
  final List<TrackSize> columnSizes;
  List<TrackSize> rowSizes;
  GridConfiguration(
      {required this.areas, required this.columnSizes, required this.rowSizes});
}
