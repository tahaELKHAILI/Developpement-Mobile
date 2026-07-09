import 'package:flutter/material.dart';

class MessageBar extends StatefulWidget {
  final Function(String) onSend;

  const MessageBar({
    super.key,
    required this.onSend,
  });

  @override
  State<MessageBar> createState() => _MessageBarState();
}

class _MessageBarState extends State<MessageBar> {
  final TextEditingController _controller = TextEditingController();

  void _handleSend() {
    final text = _controller.text.trim();

    if (text.isNotEmpty) {
      widget.onSend(text);
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [

          Expanded(
            child: TextField(
              controller: _controller,
              minLines: 1,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter your message",
              ),

              // Allows sending with keyboard
              onSubmitted: (_) => _handleSend(),
            ),
          ),

          const SizedBox(width: 8),

          IconButton(
            icon: const Icon(
              Icons.send,
              color: Color.fromARGB(255, 105, 70, 189),
            ),
            onPressed: _handleSend,
          ),
        ],
      ),
    );
  }
}