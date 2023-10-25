import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tawk/flutter_tawk.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Tawk(
        directChatLink: 'https://tawk.to/chat/65363155a84dd54dc484244d/1hddr1e5a',
        visitor: TawkVisitor(
          name: 'Mwashe Berit',
          email: 'mwasheberit@gmail.com',
        ),
        onLoad: () {
          print('Hello Tawk!');
        },
        onLinkTap: (String url) {
          print(url);
        },
        placeholder: const Center(
          child: Text('Loading...'),
        ),
      ),
    );
  }
}

// class ChatApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ChatScreen(),
//     );
//   }
// }
// // direct link: https://tawk.to/chat/65363155a84dd54dc484244d/1hddr1e5a
// class ChatScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Customer Support'),
//       ),
//       body: ChatWidget(),
//     );
//   }
// }

// class ChatWidget extends StatelessWidget {
//   final List<Message> _messages = [
//     Message('Hello, how can I help you?', MessageType.business),
//     Message('I have a question about your services.', MessageType.customer),
//     Message('Sure, what would you like to know?', MessageType.business),
//     Message('Do you offer international shipping?', MessageType.customer),
//     Message('Yes, we do offer international shipping.', MessageType.business),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Expanded(
//           child: ListView.builder(
//             itemCount: _messages.length,
//             itemBuilder: (context, index) {
//               return MessageWidget(_messages[index]);
//             },
//           ),
//         ),
//         Divider(height: 1.0),
//         ChatInput(),
//       ],
//     );
//   }
// }

// enum MessageType { customer, business }

// class Message {
//   final String text;
//   final MessageType type;

//   Message(this.text, this.type);
// }

// class MessageWidget extends StatelessWidget {
//   final Message message;

//   MessageWidget(this.message);

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: message.type == MessageType.customer
//           ? Alignment.topLeft
//           : Alignment.topRight,
//       child: Container(
//         margin: EdgeInsets.all(8.0),
//         padding: EdgeInsets.all(12.0),
//         decoration: BoxDecoration(
//           color: message.type == MessageType.customer
//               ? Colors.blue
//               : Colors.green,
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Text(
//           message.text,
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }

// class ChatInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(8.0),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(hintText: 'Type a message'),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: () {
//               // Handle sending the message
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
