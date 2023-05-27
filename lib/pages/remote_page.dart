import 'package:flutter/material.dart';

class RemotePage extends StatelessWidget {
  const RemotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Remote'),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(child: Text('Remote')),
    );
  }
}
