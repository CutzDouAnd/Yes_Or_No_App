import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading:Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://64.media.tumblr.com/avatar_01004bcfc93e_128.pnj'),
          ),
        ), //leading es la parte izquierda del appbar  donde siempre esta menu de hamburguesa, y el CircleAvatar es un widget que muestra una imagen circular, en este caso se muestra una imagen por defecto.
        title: const Text('Robbin 👀'),
        centerTitle: true,
      ),
      body: _chatView(),

    );
  }
}

class _chatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(child:ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return (index %2 == 0)
                ? const HerMessageBubble() 
                : const MyMessageBubble();
              },
            )),
        
            //Input del Mensaje
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}

