// // Automatic FlutterFlow imports
// import '/backend/supabase/supabase.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/custom_code/widgets/index.dart'; // Imports other custom widgets
// import '/flutter_flow/custom_functions.dart'; // Imports custom functions
// import 'package:flutter/material.dart';
// // Begin custom widget code
// // DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'package:supabase/supabase.dart';

// class ChatRoom extends StatefulWidget {
//   const ChatRoom({
//     Key? key,
//     this.width,
//     this.height,
//     required this.currentUserID,
//     required this.targetUserID,
//   }) : super(key: key);

//   final double? width;
//   final double? height;
//   final String currentUserID;
//   final String targetUserID;

//   @override
//   _ChatRoomState createState() => _ChatRoomState();
// }

// class _ChatRoomState extends State<ChatRoom> {
//   String msg = '';
//   final TextEditingController _messageController = TextEditingController();
//   late List<Map<String, dynamic>> messages = [];
//   late int chatRoomID;
//   final supabaseClient = SupabaseClient(
//       'https://lxthonooivjytwsbbpvp.supabase.co',
//       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx4dGhvbm9vaXZqeXR3c2JicHZwIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NzUzNTk3MCwiZXhwIjoyMDAzMTExOTcwfQ.24jExdEZ4vI7HqHHaFDvDrK3Y3SWEwT7PNu2Xa-ROsE');

//   @override
//   void initState() {
//     super.initState();
//     getChatRoom();
//   }

//   Future<void> getChatRoom() async {
//     try {
//       final response = await supabaseClient
//           .from('chatRooms')
//           .select()
//           .eq('UIDs', [widget.currentUserID, widget.targetUserID]).execute();
//       print(response.data);
//       if (response.data.isEmpty) {
//         final newChatRoom = await supabaseClient.from('chatRooms').insert({
//           'UIDs': [widget.currentUserID, widget.targetUserID],
//         }).execute();
//         chatRoomID = newChatRoom.data[0]['id'];
//         print(chatRoomID);
//       } else {
//         chatRoomID = response.data[0]['id'];
//         print(chatRoomID);
//       }
//       getMessages();
//     } catch (e) {
//       // Handle error
//       print(e);
//       setState(() {
//         messages = [];
//       });
//     }
//     // Retry after a delay
//     Future.delayed(const Duration(seconds: 5), () async {
//       try {
//         final response = await supabaseClient
//             .from('chatRooms')
//             .select()
//             .eq('UIDs', [widget.currentUserID, widget.targetUserID]).execute();
//         print(response.data);
//         if (response.data.isEmpty) {
//           final newChatRoom = await supabaseClient.from('chatRooms').insert({
//             'UIDs': [widget.currentUserID, widget.targetUserID],
//           }).execute();
//           chatRoomID = newChatRoom.data[0]['id'];
//           print(chatRoomID);
//         } else {
//           chatRoomID = response.data[0]['id'];
//           print(chatRoomID);
//         }
//         getMessages();
//       } catch (e) {
//         // Handle error
//         print(e);
//         setState(() {
//           messages = [];
//         });
//       }
//     });
//   }

//   Future<void> getMessages() async {
//     final response = await supabaseClient
//         .from('messages')
//         .select()
//         .eq('room_id', chatRoomID)
//         .execute();
//     print(response.data);
//     setState(() {
//       messages = List<Map<String, dynamic>>.from(response.data);
//       print(messages);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 final message = messages[index];
//                 final isCurrentUserMessage =
//                     message['user_id'] == widget.currentUserID;
//                 final alignment = isCurrentUserMessage
//                     ? Alignment.centerRight
//                     : Alignment.centerLeft;

//                 return Align(
//                   alignment: alignment,
//                   child: Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     child: Column(
//                       crossAxisAlignment: isCurrentUserMessage
//                           ? CrossAxisAlignment.end
//                           : CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25),
//                               color: isCurrentUserMessage
//                                   ? const Color.fromARGB(255, 19, 16, 66)
//                                   : Colors.grey),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               message['content'],
//                               style: const TextStyle(
//                                   color: Colors.white, fontSize: 16),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           message['timestamp'].toString(),
//                           style: const TextStyle(
//                               fontSize: 10,
//                               color: Color.fromARGB(255, 162, 163, 162)),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   decoration: const InputDecoration(
//                       enabledBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(
//                     width: 3,
//                     color: Color.fromARGB(255, 19, 16, 66),
//                   ))),
//                   controller: _messageController,
//                   onChanged: (value) {
//                     msg = value;
//                   },
//                   onSubmitted: (value) async {
//                     final response =
//                         await supabaseClient.from('messages').insert({
//                       'room_id': chatRoomID,
//                       'user_id': widget.currentUserID,
//                       'content': value,
//                       'timestamp': DateTime.now().toIso8601String(),
//                     }).execute();
//                     getMessages();
//                     _messageController.clear();
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10),
//                 child: Container(
//                   height: 45,
//                   width: 45,
//                   decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 19, 16, 66),
//                       borderRadius: BorderRadius.circular(15)),
//                   child: IconButton(
//                     onPressed: () async {
//                       final response =
//                           await supabaseClient.from('messages').insert({
//                         'room_id': chatRoomID,
//                         'user_id': widget.currentUserID,
//                         'content': msg,
//                         'timestamp': DateTime.now().toIso8601String(),
//                       }).execute();
//                       getMessages();
//                       _messageController.clear();
//                     },
//                     icon: const Icon(
//                       Icons.send_rounded,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
