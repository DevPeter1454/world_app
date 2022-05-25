// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:world_app/Model/allcountries.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_app/config.dart';

class WebVersion extends StatefulWidget {
  const WebVersion({Key? key}) : super(key: key);

  @override
  State<WebVersion> createState() => _WebVersionState();
}

class _WebVersionState extends State<WebVersion> {
  var list;
  var flags;
  bool isLoaded = false;
  Future getLocation() async {
    list = await getCountry();
    flags = await getCountry();
    if (list != null) {
      setState(() {
        isLoaded = true;
        print(isLoaded);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('World Countries App'),
        centerTitle: true,
        backgroundColor: Colors.amber[900],
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: SpinKitFadingCube(
          color: Colors.blue[900],
          size: 50.0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width < 1100
                    ? 3
                    : width > 1100 && width < 1200
                        ? 4
                        : 5,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: list?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/location',
                        arguments: list[index]);
                  },
                  child: Container(
                    height: 500,
                    width: 500,
                    child: Card(
                      clipBehavior: Clip.none,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const SizedBox(
                          //   height: 30,
                          // ),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(list[index].flag),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(list[index].name),
                              subtitle: Text(
                                  'Capital: ${list[index].capi.toString().substring(1, list[index].capi.toString().length - 1)}'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          currentTheme.switchTheme();
        },
        label: Text('Switch Theme'),
        icon: Icon(Icons.brightness_high),
      ),
    );
  }
}
