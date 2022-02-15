import 'package:flutter/material.dart';
import 'package:flutter_application_gg/providers/locationProvider.dart';
import 'package:flutter_application_gg/screens/add_location.dart';
import 'package:provider/provider.dart';

class LocationListPage extends StatelessWidget {
  const LocationListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _removelastLocation() {
      Provider.of<LocationProvider>(context, listen: false).popLastItem();
    }

    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _removelastLocation();
            },
            icon: const Icon(Icons.remove_circle),
            iconSize: 40,
            color: Theme.of(context).iconTheme.color,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddLocations.routname);
                },
                icon: const Icon(Icons.add_box),
                iconSize: 40,
                color: Theme.of(context).iconTheme.color),
          ],
          elevation: 10,
          toolbarHeight: screenSize.height * 0.28,
          title: const Text("LOCATIONS",
              style: TextStyle(
                  fontSize: 40, color: Color.fromARGB(255, 77, 12, 12))),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(screenSize.width, 70.0))),
        ),
        body: Consumer<LocationProvider>(
          child: const Center(
            child: Text("NO LOCATIONS TO DISPLAY",
                style: TextStyle(fontSize: 40, color: Colors.black)),
          ),
          builder: (context, locationList, child) => locationList
                  .getlocaItems.isEmpty
              ? child!
              : Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  margin: EdgeInsets.only(top: screenSize.height * 0.05),
                  child: ListView.builder(
                      itemCount: locationList.getlocaItems.length,
                      itemBuilder: (_, idx) => Padding(
                            padding: const EdgeInsets.only(
                                top: 10, right: 5, left: 5, bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: ListTile(
                                  leading: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: FileImage(
                                        locationList
                                            .getlocaItems[idx].locationImage!,
                                      )),
                                  title: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                          locationList
                                              .getlocaItems[idx].locationName,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 30)),
                                      Text(locationList.getlocaItems[idx].id,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                ),
        ));
  }
}
