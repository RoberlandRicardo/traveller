import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapSelectPlace extends StatelessWidget {
  final MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
      controller: mapController,
    );
  }
}
