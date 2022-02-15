import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:osm_nominatim/osm_nominatim.dart';

class SelectPlace extends StatefulWidget {
  @override
  State<SelectPlace> createState() => _SelectPlaceState();
}

class _SelectPlaceState extends State<SelectPlace> {
  List<Place> places = [];

  Widget item(int index) {
    return GestureDetector(
      onTap: () => Navigator.pop(context, places[index]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: 50.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(
                      width: 2,
                      color: Colors.grey,
                      style: BorderStyle.solid,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 1.0,
                        spreadRadius: 0.0,
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.black87,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(child: Text(places[index].displayName))
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            TextField(
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 9, vertical: 0),
              ),
              textInputAction: TextInputAction.search,
              keyboardType: TextInputType.streetAddress,
              onSubmitted: (string) {
                Nominatim.searchByName(
                  query: string,
                  limit: 8,
                  addressDetails: true,
                  extraTags: true,
                  nameDetails: true,
                ).then((value) => {
                      setState(() {
                        places = value;
                      })
                    });
              },
            ),
            Flexible(
                flex: 1,
                child: ListView.builder(
                    itemCount: places.length,
                    itemBuilder: (BuildContext context, int index) {
                      return item(index);
                    }))
          ],
        ),
      ),
    );
  }
}
