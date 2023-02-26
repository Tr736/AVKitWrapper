import 'package:flutter/material.dart';
import 'package:avkit/avkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _avkitPlugin = Avkit();

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() async {
    await _avkitPlugin
        .setURL('https://download.samplelib.com/mp3/sample-15s.mp3');
    await _avkitPlugin.play();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AVKIT example app'),
        ),
        body: const Center(
          child: Text('Audio should play automatically'),
        ),
      ),
    );
  }
}
