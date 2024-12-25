import 'package:flutter/material.dart';

enum MessageType { receive, send }

class MessageBubble extends StatelessWidget {
  final String text;
  final MessageType type;

  const MessageBubble({
    required this.text,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: type == MessageType.receive ? 80 : 0,
        left: type == MessageType.send ? 80 : 0,
      ),
      child: ClipPath(
        clipper: type == MessageType.receive
            ? UpperNipMessageClipper()
            : LowerNipMessageClipper(),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: type == MessageType.receive ? Color(0xFFE1E1E2) : Color(0xFF7165D6),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: type == MessageType.receive ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MessageBubble(
          text: "Hello, what can I do for you? You can book an appointment directly.",
          type: MessageType.receive,
        ),
        MessageBubble(
          text: "Hello Doctor, are you there?",
          type: MessageType.send,
        ),
      ],
    );
  }
}

class UpperNipMessageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Implement the clip path for the upper nip of the message bubble.
    // ...
    return Path();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class LowerNipMessageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Implement the clip path for the lower nip of the message bubble.
    // ...
    return Path();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
