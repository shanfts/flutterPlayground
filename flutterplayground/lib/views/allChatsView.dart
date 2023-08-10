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

// class ListChatRooms extends StatefulWidget {
//   const ListChatRooms(
//       {Key? key,
//       this.width,
//       this.height,
//       required this.userID,
//       required this.navigateTo})
//       : super(key: key);

//   final double? width;
//   final double? height;
//   final String userID;
//   final Function() navigateTo;

//   @override
//   _ListChatRoomsState createState() => _ListChatRoomsState();
// }

// class _ListChatRoomsState extends State<ListChatRooms> {
//   List<Map<String, dynamic>> otherUsers = [];
//   final supabaseClient = SupabaseClient(
//       'https://lxthonooivjytwsbbpvp.supabase.co',
//       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx4dGhvbm9vaXZqeXR3c2JicHZwIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NzUzNTk3MCwiZXhwIjoyMDAzMTExOTcwfQ.24jExdEZ4vI7HqHHaFDvDrK3Y3SWEwT7PNu2Xa-ROsE');

//   @override
//   void initState() {
//     super.initState();
//     searchChatRooms();
//   }

//   void searchChatRooms() async {
//     final response = await supabaseClient.from('chatRooms').select().execute();
//     if (response != null) {
//       final chatRooms = response.data as List<dynamic>;
//       for (final chatRoom in chatRooms) {
//         if (chatRoom['UIDs'].contains(widget.userID)) {
//           final otherUserId =
//               chatRoom['UIDs'].firstWhere((uid) => uid != widget.userID);
//           final userResponse = await supabaseClient
//               .from('users')
//               .select()
//               .eq('id', otherUserId)
//               .single()
//               .execute();
//           if (userResponse != null) {
//             setState(() {
//               otherUsers.add(userResponse.data);
//             });
//           }
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView.builder(
//         itemCount: otherUsers.length,
//         itemBuilder: (context, index) {
//           final user = otherUsers[index];
//           return ListTile(
//             trailing: IconButton(
//                 color: const Color.fromARGB(255, 19, 16, 66),
//                 iconSize: 30,
//                 onPressed: () {
//                   widget.navigateTo();
//                 },
//                 icon: const Icon(
//                   Icons.arrow_circle_right,
//                   color: Color.fromARGB(255, 19, 16, 66),
//                 )),
//             title: Text(
//               '${user['name']} ${user['surname']}',
//               style: const TextStyle(
//                 fontSize: 18,
//                 color: Color.fromARGB(255, 19, 16, 66),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
