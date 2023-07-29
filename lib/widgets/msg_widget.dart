import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ru_admin/network/network.dart';

class MsgWidget extends StatefulWidget {
  const MsgWidget({super.key});

  @override
  State<MsgWidget> createState() => _MsgWidgetState();
}

class _MsgWidgetState extends State<MsgWidget> {
  final TextEditingController title = TextEditingController();
  final TextEditingController msg = TextEditingController();
  final TextEditingController textColor = TextEditingController();
  bool isImage = false;

  @override
  void dispose() {
    msg.dispose();
    textColor.dispose();
    title.dispose();
    super.dispose();
  }

  Future<void> _postDataToServer(String data) async {
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
            controller: title,
            decoration: const InputDecoration(
              hintText: 'Título',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: msg,
            decoration: const InputDecoration(
              hintText: 'Seu Notícia',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: textColor,
            decoration: const InputDecoration(
              hintText: 'Cor para fundo',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              String inputText = jsonEncode({
                'title': title.text,
                'msg': msg.text,
                'isImage': isImage,
                'textColor': textColor.text,
              });
              await _postDataToServer(inputText);
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
