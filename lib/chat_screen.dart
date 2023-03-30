import 'dart:async';

import 'package:chatgpt/chat_provider.dart';
import 'package:chatgpt/widgets/chat_message.dart';
import 'package:chatgpt/widgets/text_composer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatProvider _chatProvider = ChatProvider();



  @override
  void initState() {
    _chatProvider.chatGPT = OpenAI.instance;
    super.initState();
  }

  @override
  void dispose() {
    _chatProvider.streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChatProvider>(
      create: (context) => _chatProvider,
      child: Consumer<ChatProvider>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("ChatGPT"),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Flexible(
                    child: ListView.builder(
                      reverse: true,
                  controller: ScrollController(initialScrollOffset: 9999999),
                  itemCount: _chatProvider.messages.length,
                  itemBuilder: (context, index) =>ChatMessage(msgText: _chatProvider.messages[index].msgText, msgSender: _chatProvider.messages[index].msgSender),
                )),
                TextComposer(chatProvider: _chatProvider)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
