import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_affirmation_counter/theme/gaps.dart';
import 'package:hardware_button_listener/hardware_button_listener.dart';
import 'package:hardware_button_listener/models/hardware_button.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key, required this.title});
  final String title;

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  String _lastButtonPressed = 'No button pressed yet';
  int _counter = 0;

  final _hardwareButtonListener = HardwareButtonListener();
  late StreamSubscription<HardwareButton> _buttonSubscription;

  @override
  void initState() {
    super.initState();
    // Start listening for hardware button events
    startListeningToHardwareButtons();
  }

  @override
  void dispose() {
    // Cancel the subscription to free up resources
    _buttonSubscription.cancel();
    super.dispose();
  }

  // Listen for hardware button events and update the UI
  void startListeningToHardwareButtons() {
    _buttonSubscription = _hardwareButtonListener.listen((event) {
      // log(event.buttonKey.toString());
      // log(event.buttonName.toString());
      setState(() {
        _lastButtonPressed = event.buttonName.toString();
        if (_lastButtonPressed == 'VOLUME_UP') {
          _incrementCounter();
        } else if (_lastButtonPressed == 'VOLUME_DOWN') {
          _decrementCounter();
        }
      });
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Hardware Button Listener Example'),
        // ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_counter',
                style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
              gapH24,
              ElevatedButton(
                onPressed: _resetCounter,
                child: const Text('RESET'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
