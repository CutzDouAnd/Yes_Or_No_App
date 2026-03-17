import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();  
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola Robbin', fromWho: FromWho.me),
    Message(text: 'Como estas?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {

    if (text.isEmpty) return; // si el mensaje esta vacio, no se hace nada, para evitar agregar mensajes vacios a la lista.

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if(text .endsWith('?')) {
      herReply();
    }

    notifyListeners(); //Notifica que hubo un cambio en la lista de mensajes, para que los 
    //widgets que estan escuchando este provider se reconstruyan y muestren el nuevo mensaje en la pantalla.

    moveScrollToBottom(); // cada vez que se agrega un nuevo mensaje, se llama a esta funcion para mover el scroll hacia abajo y mostrar el ultimo mensaje agregado.
  }

  Future <void> herReply() async {

    final herMessage = await getYesNoAnswer.getAnswer(); // se obtiene la respuesta de la API, que es un mensaje de tipo Message, y se guarda en la variable herMessage.

    messageList.add(herMessage); // se agrega el mensaje de la respuesta a la lista de mensajes.
    notifyListeners(); // se notifica que hubo un cambio en la lista de mensajes, para que los widgets que estan escuchando este provider se reconstruyan y muestren el nuevo mensaje en la pantalla.

    moveScrollToBottom(); // cada vez que se agrega un nuevo mensaje, se llama a esta funcion para mover el scroll hacia abajo y mostrar el ultimo mensaje agregado.
  }

  Future<void> moveScrollToBottom() async { // funcion para mover el scroll hacia abajo cada vez que se agrega un nuevo mensaje, para que el usuario siempre vea el ultimo mensaje agregado.
    
    await Future.delayed(const Duration(milliseconds: 100)); // se agrega un delay para que el ListView tenga tiempo de reconstruirse y mostrar el nuevo mensaje antes de mover el scroll, si no se agrega este delay, el scroll se moveria antes de que el ListView se reconstruya y no se veria el nuevo mensaje agregado.

      chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
    );
  }

}