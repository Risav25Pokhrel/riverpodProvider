import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodprovider/pages/combineprovider.dart';
import 'package:riverpodprovider/pages/futureprovider.dart';
import 'package:riverpodprovider/pages/provider.dart';
import 'package:riverpodprovider/pages/stateprovider.dart';
import 'package:riverpodprovider/pages/streamprovider.dart';
import 'package:riverpodprovider/widget/buttonwidget.dart';

//add flutter riverpod with null safety from pub.dev for latest version to pubspec.yamal under dependencies
void main() {
  runApp(ProviderScope(
    /////wrap material with provider scope for functionality of riverpod
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.indigo),
      home: const myapp(),
    ),
  ));
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RIVERPOD EXPLAINATION")),
      body: const riverpodproviders(),
    );
  }
}

class riverpodproviders extends StatelessWidget {
  const riverpodproviders({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Spacer(),
        MyButton(
            text: "PROVIDER",
            onclicked: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const Providerpage()))),
        const Spacer(),
        MyButton(
            text: "STATE PROVIDER",
            onclicked: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const stateProvider()))),
        const Spacer(),
        MyButton(
            text: "FUTURE PROVIDER",
            onclicked: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const Futureprovider()))),
        const Spacer(),
        MyButton(
            text: "STREAM PROVIDER",
            onclicked: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const Streamprovider()))),
        const Spacer(),
        MyButton(
            text: "COMBINED PROVIDER",
            onclicked: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const Combinedprovider()))),
        const Spacer(),
      ]),
    );
  }
}
