import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  final String msgText, msgSender;
  const ChatMessage({Key? key,required this.msgText,required this.msgSender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: CircleAvatar(child:Text(msgSender[0])),
          ),
          Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(msgSender,style: Theme.of(context).textTheme.subtitle1,),
              Padding(padding: const EdgeInsets.only(top: 0.5),
              child: Text(msgText),)
            ],
          )
        ],
      ),
    ).px8().py4();
  }
}
