import 'package:flutter/material.dart';
// import 'package:worldapp/Model/allcountries.dart';
import 'package:world_app/Model/allcountries.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_app/config.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
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
    return Scaffold(
        appBar: AppBar(
          title: const Text('World Countries App'),
          backgroundColor: Colors.blue[700],
          centerTitle: true,
        ),
        body: Visibility(
            visible: isLoaded,
            replacement: SpinKitWanderingCubes(
              color: Colors.blue[900],
              size: 50.0,
            ),
            child: ListView.builder(
              itemCount: list?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/location',
                          arguments: list[index]);
                    },
                    title: Text(list[index].name),
                    subtitle:  Text(
                        'Capital: ${list[index].capi.toString().substring(1, list[index].capi.toString().length - 1)}'),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(list[index].flag),
                    ),
                  ),
                );
              },
            )),
  floatingActionButton: FloatingActionButton(
    onPressed: (){
       currentTheme.switchTheme();
    },
    child:const  Icon(Icons.brightness_high),
    ),
            
            );
  }
}
