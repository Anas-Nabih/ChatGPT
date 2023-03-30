import 'dart:async';
import 'package:chatgpt/chat_message_model.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/cupertino.dart';

class ChatProvider extends ChangeNotifier {
  TextEditingController composerController = TextEditingController();

  StreamSubscription? streamSubscription;
  OpenAI? chatGPT;

  List<ChatMessageModel> messages = [];

  sendMessage({required String msgText, required String msgSender}) {
    messages.insert(
        0, ChatMessageModel(msgText: msgText, msgSender: msgSender));
    final request =
    ChatCompleteText(messages: [{"user":msgText}], maxToken: 200, model: kTextDavinci3);
    streamSubscription = chatGPT!
        .build(token: "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")
        .onChatCompletionStream(request: request)
        .listen((response) {
          messages.insert(0, ChatMessageModel(msgSender: response!.choices[0]!.message.content, msgText: "bot"));
    });
    notifyListeners();

    debugPrint("msg:$msgText, Sender: $msgSender");
    composerController.clear();
  }
}
