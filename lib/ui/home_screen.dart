import 'package:flutter/material.dart';
import 'package:untitled/custom_widgets/read_more_custom_animated_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const Text(
                'With animation',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CustomReadMoreWidget(
                  maxLines: 1,
                  data:
                      'Hi this is the text with the animation and you can specify maxlines as per your need. so this is testing text '),
const SizedBox(height: 20,),
              const Text('Without animation',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              CustomReadMoreWidget(
                  maxLines: 1,
                  animation: false,
                  data:
                      'Hi this is the text with the animation and you can specify maxlines as per your need. so this is testing text '),

              const SizedBox(height: 20,),

             /// note that if you want custom widget for collapsed widgets than you have to provide both readLessWidget & readMoreWidget to apply
              const Text('Customized widget of collapsed',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              CustomReadMoreWidget(
                  maxLines: 1,
                  readLessWidget: const Row(
                    children: [
                      Text('Move up'),
                      Icon(Icons.ac_unit_sharp)
                    ],
                  ),
                  readMoreWidget:const Row(
                    children: [
                      Text('Move down'),
                      Icon(Icons.accessibility_rounded)
                    ],
                  ) ,
                  animation: true,
                  data:
                      'Hi this is the text with the animation and you can specify maxlines as per your need. so this is testing text '),
            ],
          ),
        ),
      ),
    );
  }
}
