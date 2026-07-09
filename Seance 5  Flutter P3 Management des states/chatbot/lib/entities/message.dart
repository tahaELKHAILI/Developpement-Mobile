enum Sender{user, bot}

class ChatMessage {
  final String text;
  final Sender sender;
  final DateTime timeStamp;

  //Constructor
  ChatMessage({
    required this.text,
    required this.sender,
    DateTime? timeStamp,
  }) : timeStamp = timeStamp ?? DateTime.now();

}