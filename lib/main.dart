import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main(){
  runApp(
    const MaterialApp(
      home: CustomErrorScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class CustomErrorScreen extends StatefulWidget {
  const CustomErrorScreen({Key? key}) : super(key: key);

  @override
  State<CustomErrorScreen> createState() => _CustomErrorScreenState();
}

class _CustomErrorScreenState extends State<CustomErrorScreen> {

  //Map with fake data to simulate an error of null value
  Map<String, dynamic> items = {'name': 'Danilo Monteiro Souza'};

  @override
  Widget build(BuildContext context) {

    // Creating a custom system error screen
    ErrorWidget.builder = (FlutterErrorDetails details){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.lightGreen,
          body: Center(
            child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                child: Column(
                  children: <Widget>[
                    Lottie.asset('assets/lottie_animations/error_system.json'),
                    Text(
                      '${details.exception}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
      );
    };

    // App Screen
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error page custom'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(items['email']),
      ),
    );
  }
}
