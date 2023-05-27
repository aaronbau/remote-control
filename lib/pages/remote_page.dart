import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

class RemotePage extends StatefulWidget {
  const RemotePage({super.key});

  @override
  State<RemotePage> createState() => _RemotePageState();
}

class _RemotePageState extends State<RemotePage> {
  bool waterValue = true;
  bool brushValue = false;
  bool isStart = true;
  double sliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Remote Control'),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Text('Water'),
                Switch(
                  value: waterValue,
                  onChanged: (value) => setState(() => waterValue = value),
                ),
                const Text('Brush'),
                Switch(
                  value: brushValue,
                  onChanged: (value) => setState(() => brushValue = value),
                ),
              ],
            ),
            Joystick(listener: (_) {}),
            FilledButton(
              onPressed: () => setState(() => isStart = !isStart),
              child: isStart ? const Text('START') : const Text('STOP'),
            ),
            Text('Speed: ${sliderValue.ceil().toString()}'),
            Slider(
              value: sliderValue,
              max: 100,
              onChanged: (value) => setState(() => sliderValue = value),
            )
          ],
        ),
      ),
    );
  }
}
