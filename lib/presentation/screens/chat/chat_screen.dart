import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
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
        //centerTitle: true,
      ),
      body: _chatView(),

    );
  }
}

class _chatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      //final chatProvider = context.watch<ChatProvider>().messageList; //estara pendiente de los cambios en la lista de mensajes, 
      //cada vez que se agregue un nuevo mensaje, el widget se reconstruira y se mostrara el nuevo mensaje en la pantalla. 

      final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(child:ListView.builder(
              controller: chatProvider.chatScrollController, // se agrega un controlador de scroll para que el ListView se mantenga en la parte inferior cuando se agregue un nuevo mensaje, y no se quede en la parte superior mostrando los mensajes anteriores.
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];
                return (message.fromWho == FromWho.me) 
                  ?  MyMessageBubble(message: message,)
                  : const HerMessageBubble();
              },  
            )),
        
            //Input del Mensaje
            MessageFieldBox(
             // onValue: (value) => chatProvider.sendMessage(value), version Larga
              onValue: chatProvider.sendMessage, // version corta, se le pasa la referencia a la funcion sendMessage del chatProvider, sin necesidad de crear una funcion anonima que llame a sendMessage.
            ),
          ],
        ),
      ),
    );
  }
}

