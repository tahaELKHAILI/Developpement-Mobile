import 'package:chatbot/entities/message.dart';
import 'package:chatbot/services/ChatService.dart';
import 'package:chatbot/widgets/chat_list.widget.dart';
import 'package:chatbot/widgets/message_bar.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}


class _ChatPageState extends State<ChatPage> {

  final List<ChatMessage> messages = [];

  final List<Map<String, String>> chatHistory = [];

  late ChatService chatService;

  bool isTyping = false;



  @override
  void initState() {
    super.initState();

    chatService = ChatService(
      apiKey: dotenv.env['API_KEY']!,
      endpoint: dotenv.env['ENDPOINT']!,
      model: dotenv.env['MODEL'] ?? 'llama-3.3-70b-versatile',
    );
  }



  Future<void> _sendMessage(String text) async {

    setState(() {

      messages.add(
        ChatMessage(
          text: text,
          sender: Sender.user,
        ),
      );

      isTyping = true;

    });



    chatHistory.add({
      "role": "user",
      "content": text,
    });



    try {

      final response = await chatService.sendMessage(
        chatHistory,
      );


      chatHistory.add({
        "role": "assistant",
        "content": response,
      });



      setState(() {

        isTyping = false;

        messages.add(
          ChatMessage(
            text: response,
            sender: Sender.bot,
          ),
        );

      });



    } catch (e) {

      setState(() {

        isTyping = false;

        messages.add(
          ChatMessage(
            text: "Something went wrong. Please try again.",
            sender: Sender.bot,
          ),
        );

      });

    }

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF6F3FA),



      appBar: AppBar(

        elevation: 0,

        backgroundColor: const Color.fromARGB(255, 105, 70, 189),


        leading: IconButton(

          onPressed: () => Navigator.pop(context),

          icon: const Icon(

            Icons.arrow_back,

            color: Colors.white,

          ),

        ),



        title: Row(

          children: [


            const CircleAvatar(

              radius: 18,

              backgroundColor: Colors.white,

              child: Icon(

                Icons.smart_toy,

                color: Color.fromARGB(255, 105, 70, 189),

              ),

            ),



            const SizedBox(width: 12),



            Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: const [

                Text(

                  "AI Assistant",

                  style: TextStyle(

                    color: Colors.white,

                    fontSize: 18,

                    fontWeight: FontWeight.bold,

                  ),

                ),


                Text(

                  "Online",

                  style: TextStyle(

                    color: Colors.white70,

                    fontSize: 12,

                  ),

                ),

              ],

            ),

          ],

        ),

      ),



      body: SafeArea(

        child: Column(

          children: [



            Expanded(

              child: ChatList(

                messages: messages,

              ),

            ),



            if (isTyping)

              Container(

                margin: const EdgeInsets.only(

                  left: 15,

                  bottom: 8,

                ),


                alignment: Alignment.centerLeft,


                child: Container(

                  padding: const EdgeInsets.symmetric(

                    horizontal: 15,

                    vertical: 8,

                  ),


                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius: BorderRadius.circular(20),

                  ),


                  child: const Row(

                    mainAxisSize: MainAxisSize.min,

                    children: [


                      SizedBox(

                        width: 15,

                        height: 15,

                        child: CircularProgressIndicator(

                          strokeWidth: 2,

                        ),

                      ),


                      SizedBox(width: 10),


                      Text(

                        "AI is typing...",

                        style: TextStyle(

                          color: Colors.grey,

                        ),

                      ),

                    ],

                  ),

                ),

              ),



            Container(

              decoration: const BoxDecoration(

                color: Colors.white,

                boxShadow: [

                  BoxShadow(

                    color: Colors.black12,

                    blurRadius: 8,

                  ),

                ],

              ),


              child: MessageBar(

                onSend: isTyping ? (_) {} : _sendMessage,

              ),

            ),


          ],

        ),

      ),

    );

  }

}