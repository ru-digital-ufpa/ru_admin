import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ru_admin/network/network.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  final TextEditingController imageLink = TextEditingController();
  final bool isImage = true;
  @override
  void dispose() {
    imageLink.dispose();
    super.dispose();
  }

  Future<void> postDataToServer(String data) async {
    print(data);

    NetworkHelper post = NetworkHelper();

    await post.postMsg(data);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: imageLink,
            decoration: const InputDecoration(
              hintText: 'O link da imagem',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              String inputText =
                  jsonEncode({'imageUrl': imageLink.text, 'isImage': isImage});
              await postDataToServer(inputText);
              imageLink.clear;
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Input Text'),
                  content:
                      Text('You entered: $inputText\nData posted to server.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
