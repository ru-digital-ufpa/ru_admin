import 'package:flutter/material.dart';
import 'package:ru_admin/widgets/image_widget.dart';

import 'package:ru_admin/widgets/msg_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RU App Admin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'RU App Admin'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isImage = false;
  int initialLabelIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
              width: double.infinity,
            ),
            ToggleSwitch(
              minWidth: 90.0,
              fontSize: 16,
              initialLabelIndex: initialLabelIndex,
              totalSwitches: 2,
              labels: const ['Notícia', 'Imagem'],
              onToggle: (index) {
                setState(() {
                  if (index == 1) {
                    isImage = true;
                    initialLabelIndex = 1;
                  } else {
                    isImage = false;
                    initialLabelIndex = 0;
                  }
                });
              },
            ),
            isImage ? const ImageWidget() : const MsgWidget(),
          ],
        ),
      ),
    );
  }
}
