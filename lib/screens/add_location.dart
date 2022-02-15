import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_gg/providers/locationProvider.dart';
import 'package:flutter_application_gg/widgets/image_input.dart';
import 'package:provider/provider.dart';

class AddLocations extends StatefulWidget {
  const AddLocations({Key? key}) : super(key: key);
  static const routname = "add-loacaiton-page";

  @override
  _AddLocationsState createState() => _AddLocationsState();
}

class _AddLocationsState extends State<AddLocations> {
  final _placeName = TextEditingController();
  @override
  void dispose() {
    _placeName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    File? _finalImage;

    void _assingImage(File fimg) {
      _finalImage = fimg;
    }

    void _addPlace() {
      if (_finalImage == null) {
        return;
      }
      Provider.of<LocationProvider>(context, listen: false)
          .addLocations(img: _finalImage, title: _placeName.text);
      Navigator.of(context).pop();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: screensize.height * 0.28,
        title: const Text("ADD LOCATIONS",
            style: TextStyle(
                fontSize: 40, color: Color.fromARGB(255, 77, 12, 12))),
        centerTitle: true,
        elevation: 10,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_circle_left),
          iconSize: 40,
          color: Theme.of(context).iconTheme.color,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(screensize.width, 70.0))),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: screensize.height * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 2.0,
                                spreadRadius: 2.0,
                                offset: Offset(2.0, 2.0),
                              ),
                            ]),
                        width: screensize.width,
                        child: TextField(
                          onChanged: (val) {
                            _placeName.text = val;
                          },
                          decoration: InputDecoration(
                              hintText: "location name",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary))),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: screensize.width,
                      height: screensize.height * 0.2,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              offset: Offset(2.0, 2.0),
                            ),
                          ]),
                      child: ImageInput(_assingImage),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _addPlace();
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 77, 12, 12),
                      size: 40,
                    ),
                    Text("add place",
                        style: TextStyle(
                            fontSize: 40,
                            color: Color.fromARGB(255, 77, 12, 12)))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
