import 'package:chatbot/entities/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ChatBubble extends StatelessWidget {

  final ChatMessage message;


  const ChatBubble({
    super.key,
    required this.message,
  });



  @override
  Widget build(BuildContext context) {

    final bool isMe = message.sender == Sender.user;


    return Container(

      margin: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 10,
      ),


      child: Row(

        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,


        crossAxisAlignment: CrossAxisAlignment.start,


        children: [


          if (!isMe)
            const CircleAvatar(
              radius: 18,
              backgroundColor: Color.fromARGB(255, 105, 70, 189),
              child: Icon(
                Icons.smart_toy,
                color: Colors.white,
                size: 20,
              ),
            ),



          const SizedBox(width: 8),



          Flexible(
            child: Container(

              padding: const EdgeInsets.all(12),


              decoration: BoxDecoration(

                color: isMe
                    ? const Color.fromARGB(255, 105, 70, 189)
                    : const Color.fromARGB(255, 230, 224, 240),


                borderRadius: BorderRadius.only(

                  topLeft: const Radius.circular(18),

                  topRight: const Radius.circular(18),


                  bottomLeft: Radius.circular(
                    isMe ? 18 : 0,
                  ),


                  bottomRight: Radius.circular(
                    isMe ? 0 : 18,
                  ),

                ),

              ),



              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [


                  Text(

                    message.text,

                    style: TextStyle(

                      color: isMe
                          ? Colors.white
                          : Colors.black87,


                      fontSize: 16,

                    ),

                  ),



                  const SizedBox(height: 5),



                  Text(

                    DateFormat("HH:mm")
                        .format(message.timeStamp),


                    style: TextStyle(

                      fontSize: 11,

                      color: isMe
                          ? Colors.white70
                          : Colors.grey,

                    ),

                  ),

                ],

              ),

            ),

          ),



          const SizedBox(width: 8),



          if (isMe)

            const CircleAvatar(

              radius: 18,

              backgroundColor: Colors.deepOrange,

              child: Icon(

                Icons.person,

                color: Colors.white,

                size: 20,

              ),

            ),

        ],

      ),

    );

  }

}