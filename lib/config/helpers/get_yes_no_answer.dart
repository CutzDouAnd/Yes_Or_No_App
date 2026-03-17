import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';


class GetYesNoAnswer {

  final _dio = Dio();

  Future<Message> getAnswer() async {

      final response = await _dio.get('https://yes-no-wtf.vercel.app/api'); // peticion a la API para obtener una respuesta de 
      //si o no, la respuesta es un JSON con la siguiente estructura: 
      //{ answer: 'yes' o 'no', image: 'url de una imagen relacionada con la respuesta' }

      final yesNodata = YesNoModel.fromJsonMap(response.data); // se transforma la respuesta de la API en un objeto de 
      //tipo YesNoModel, que es un modelo que se encarga de mapear la respuesta de la API a un objeto de nuestro dominio, 
      //en este caso, un objeto de tipo Message, que es el tipo de mensaje que usamos en nuestra aplicacion para mostrar 
      //los mensajes en el chat.
      
      //Mappers son funciones que se encargan de transformar los datos que obtenemos de la API en objetos 
      //de nuestro dominio, en este caso, transformamos la respuesta de la API en un objeto de tipo Message,
      // que es el tipo de mensaje que usamos en nuestra aplicacion para mostrar los mensajes en el chat.
      
      
      
      return yesNodata.toMessageEntity(); // se transforma el objeto de tipo YesNoModel en un objeto de tipo Message, que es el tipo de mensaje que usamos en nuestra aplicacion para mostrar los mensajes en el chat, y se retorna ese objeto de tipo Message para que pueda ser agregado a la lista de mensajes del chat.

      throw UnimplementedError(); // se lanza un error de tipo UnimplementedError para indicar que esta funcion aun no esta implementada, esto es util para evitar que se llame a esta funcion antes de que este implementada y cause errores en la aplicacion.
    
  }


}