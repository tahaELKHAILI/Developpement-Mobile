import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:chatbot/services/ChatService.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  print(dotenv.env);

  final chatService = ChatService(
    apiKey: dotenv.env['API_KEY']!,
    endpoint: dotenv.env['ENDPOINT']!,
    model: dotenv.env['MODEL'] ?? 'llama-3.3-70b-versatile',
  );

  print("KEY: ${dotenv.env['API_KEY']}");
  print("ENDPOINT: ${dotenv.env['ENDPOINT']}");
  print("MODEL: ${dotenv.env['MODEL']}");

  final response = await chatService.sendMessage([
    {
      "role": "user",
      "content": "Hello! Who are you?"
    }
  ]);

  print(response);
}