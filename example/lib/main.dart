import 'package:flutter/material.dart';
import 'dart:async';
import 'package:has_audio/has_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool hasAudio = false;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    bool check;

    check = await HasAudio.check("path/to/video.mp4");

    if (!mounted) return;

    setState(() {
      hasAudio = check;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Check video has audio'),
        ),
        body: Center(
          child: Text('has audio: $hasAudio\n'),
        ),
      ),
    );
  }
}
