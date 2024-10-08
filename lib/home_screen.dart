// import 'dart:convert';
// import 'package:detest/Image_download.dart';
// import 'package:detest/Inferenced_Data copy.dart';
// import 'package:detest/country/Germany.dart';
// import 'package:detest/country/Spain.dart';
// import 'package:detest/country/UkData.dart';
// import 'package:detest/country/UsaData.dart';
// import 'package:detest/country/_France.dart';
// import 'package:detest/country/India.dart';
// import 'package:detest/country/lab.dart';
// import 'package:http/http.dart' as http;
// import 'package:detest/device_screen.dart';
// import 'package:detest/login.dart';
// import 'package:detest/text_input_field.dart';
// import 'package:flutter/material.dart';
// import 'config_screen.dart';
// import 'constant.dart';
// import 'package:detest/weatherData.dart';
// import 'package:detest/insectCount.dart';
// import 'package:numberpicker/numberpicker.dart';
// import 'package:intl/intl.dart';
// import 'filteredData.dart';
// import 'package:detest/Battery.dart';

// class HomeScreen extends StatefulWidget {
//   final String email;

//   const HomeScreen({super.key, required this.email});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Future<String> response;
//   late TextEditingController _serialId;
//   late TextEditingController _securityKey;
//   late TextEditingController _searchController;
//   late TextEditingController dateController;
//   late TextEditingController timeinput;
//   late String result;
//   void selectedCountry = "";
//   late int sleepDuration = 0;
//   bool _hovering = false;
//   bool condition = false;
//   @override
//   void initState() {
//     response = getData(widget.email);
//     _serialId = TextEditingController();
//     _securityKey = TextEditingController();
//     dateController = TextEditingController();
//     timeinput = TextEditingController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _serialId.dispose();
//     _securityKey.dispose();
//     super.dispose();
//   }

//   Future<void> _dialogBuilder(BuildContext context) {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Center(
//               child: Text(
//             'Register a new Device ',
//             style: TextStyle(color: buttonColor),
//           )),
//           content: SizedBox(
//             height: 140,
//             width: 400,
//             child: Column(
//               children: [
//                 const SizedBox(height: 10),
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   margin: const EdgeInsets.symmetric(horizontal: 20),
//                   child: TextInputField(
//                     initalvalue: 'D0999',
//                     controller: _serialId,
//                     labelText: 'Device ID',
//                     icon: Icons.devices,
//                   ),
//                 ),
//                 const SizedBox(height: 25),
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   margin: const EdgeInsets.symmetric(horizontal: 20),
//                   child: TextInputField(
//                     initalvalue: '1234',
//                     controller: _securityKey,
//                     labelText: 'Serial ID',
//                     icon: Icons.devices,
//                     // isObscure: true,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             MaterialButton(
//               textColor: Colors.white,
//               color: Colors.red,
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             MaterialButton(
//               textColor: Colors.white,
//               color: buttonColor,
//               child: const Text('Register'),
//               onPressed: () {
//                 RegistrationUser();
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _filter(BuildContext context) {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//             title: const Center(
//                 child: Text(
//               'Select a Country',
//               style: TextStyle(color: buttonColor),
//             )),
//             content: SizedBox(
//               height: 400,
//               width: 400,
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: const EdgeInsets.symmetric(horizontal: 20),
//                     // child: ElevatedButton.icon(
//                     //   onPressed: () {
//                     //     setState(() {
//                     //       allData();
//                     //     });
//                     //     Navigator.of(context).pop();
//                     //   },
//                     //   icon: const Icon(
//                     //     Icons.logout,
//                     //     color: backgroundColor,
//                     //   ),
//                     //   label: const Text(
//                     //     'All',
//                     //     style: TextStyle(fontWeight: FontWeight.bold),
//                     //   ),
//                     //   style: ElevatedButton.styleFrom(
//                     //       // elevation: 10,
//                     //       backgroundColor: Color.fromARGB(164, 14, 211, 7)),
//                     // ),
//                   ),
//                   const SizedBox(height: 20),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: const EdgeInsets.symmetric(horizontal: 20),
//                     child: ElevatedButton.icon(
//                       onPressed: () {
//                         setState(() {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => germanyScreen()),
//                           );
//                         });
//                       },
//                       icon: const Icon(
//                         Icons.logout,
//                         color: backgroundColor,
//                       ),
//                       label: const Text(
//                         'Germany',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                           // elevation: 10,
//                           backgroundColor: Color.fromARGB(164, 14, 211, 7)),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: const EdgeInsets.symmetric(horizontal: 20),
//                     child: ElevatedButton.icon(
//                       onPressed: () {
//                         setState(() {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => SpainScreen()),
//                           );
//                         });
//                       },
//                       icon: const Icon(
//                         Icons.logout,
//                         color: backgroundColor,
//                       ),
//                       label: const Text(
//                         'Spain',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                           // elevation: 10,
//                           backgroundColor: Color.fromARGB(164, 14, 211, 7)),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: const EdgeInsets.symmetric(horizontal: 20),
//                     child: ElevatedButton.icon(
//                       onPressed: () {
//                         setState(() {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => franceScreen()),
//                           );
//                         });
//                       },
//                       icon: const Icon(
//                         Icons.logout,
//                         color: backgroundColor,
//                       ),
//                       label: const Text(
//                         'France',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                           // elevation: 10,
//                           backgroundColor: Color.fromARGB(164, 14, 211, 7)),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: const EdgeInsets.symmetric(horizontal: 20),
//                     child: ElevatedButton.icon(
//                       onPressed: () {
//                         setState(() {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => UK_Screen()),
//                           );
//                         });
//                         // Navigator.of(context).pop();
//                       },
//                       icon: const Icon(
//                         Icons.logout,
//                         color: backgroundColor,
//                       ),
//                       label: const Text(
//                         'UK',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                           // elevation: 10,
//                           backgroundColor: Color.fromARGB(164, 14, 211, 7)),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: const EdgeInsets.symmetric(horizontal: 20),
//                     child: ElevatedButton.icon(
//                       onPressed: () {
//                         setState(() {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => USA_Screen()),
//                           );
//                         });
//                       },
//                       icon: const Icon(
//                         Icons.logout,
//                         color: backgroundColor,
//                       ),
//                       label: const Text(
//                         'USA',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                           // elevation: 10,
//                           backgroundColor: Color.fromARGB(164, 14, 211, 7)),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: const EdgeInsets.symmetric(horizontal: 20),
//                     child: ElevatedButton.icon(
//                       onPressed: () {
//                         setState(() {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => INDIA_Screen()),
//                           );
//                         });
//                       },
//                       icon: const Icon(
//                         Icons.logout,
//                         color: backgroundColor,
//                       ),
//                       label: const Text(
//                         'INDIA',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                           // elevation: 10,
//                           backgroundColor: Color.fromARGB(164, 14, 211, 7)),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: const EdgeInsets.symmetric(horizontal: 20),
//                     child: ElevatedButton.icon(
//                       onPressed: () {
//                         setState(() {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LabScreen()),
//                           );
//                         });
//                       },
//                       icon: const Icon(
//                         Icons.logout,
//                         color: backgroundColor,
//                       ),
//                       label: const Text(
//                         'Lab',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                           // elevation: 10,
//                           backgroundColor: Color.fromARGB(164, 14, 211, 7)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             actions: <Widget>[
//               MaterialButton(
//                 textColor: Colors.white,
//                 color: Colors.red,
//                 child: const Text('Cancel'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ]);
//       },
//     );
//   }

//   Future RegistrationUser() async {
//     var APIURL = Uri.parse(
//         "https://uo1t934012.execute-api.us-east-1.amazonaws.com//addNewDevice");
//     Map mapeddate = {
//       'device_id': _serialId.text,
//       'serial_id': _securityKey.text,
//       'email': widget.email
//     };
//     String requestBody = jsonEncode(mapeddate);
//     // print("JSON DATA: ${requestBody}");
//     http.Response response = await http.post(APIURL, body: requestBody);
//     var data = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(data.toString()),
//           duration: Duration(seconds: 3),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } else {
//       throw Exception('Failed to load api');
//     }
//   }

//   // Future<void> rebootDevice(String deviceId, String status) async {
//   //   String result = " ";
//   //   const url =
//   //       'https://2cbz9w9ydi.execute-api.us-east-1.amazonaws.com/deviceReboot';

//   //   final headers = <String, String>{
//   //     'Content-Type': 'application/json',
//   //   };

//   //   final payload =
//   //       json.encode({'deviceId': deviceId, 'message': 'Reboot Device'});

//   //   try {
//   //     final response =
//   //         await http.post(Uri.parse(url), headers: headers, body: payload);

//   //     if (response.statusCode == 200) {
//   //       result = '1';
//   //       print('Reboot request sent successfully');
//   //     } else {
//   //       result = '2';
//   //       print(
//   //           'Failed to send reboot request. Status code: ${response.statusCode}');
//   //     }
//   //   } catch (e) {
//   //     result = '3';
//   //     print('Error occurred while sending reboot request: $e');
//   //   }
//   //   return showDialog<void>(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       if (result == '1' && status == "active") {
//   //         return AlertDialog(
//   //           title: const Center(
//   //               child: Text(
//   //             "Reboot request sent successfully",
//   //             style: TextStyle(color: Color.fromARGB(255, 13, 77, 15)),
//   //           )),
//   //         );
//   //       } else {
//   //         return AlertDialog(
//   //           title: const Center(
//   //               child: Text(
//   //             "Failed to send reboot request",
//   //             style: TextStyle(color: Color.fromARGB(255, 188, 29, 18)),
//   //           )),
//   //         );
//   //       }
//   //     },
//   //   );
//   // }

//   // Future<void> sleepDevice(String type, String deviceId, int time) async {
//   //   String result = " ";
//   //   const url =
//   //       'https://9905c6492h.execute-api.us-east-1.amazonaws.com/sleepDevice-V1';

//   //   final headers = <String, String>{
//   //     'Content-Type': 'application/json',
//   //   };

//   //   final payload = json
//   //       .encode({'type': '1', 'deviceId': deviceId, 'time': time.toString()});

//   //   try {
//   //     final response =
//   //         await http.post(Uri.parse(url), headers: headers, body: payload);

//   //     if (response.statusCode == 200) {
//   //       result = '1';
//   //       print('Sleep request sent successfully');
//   //     } else {
//   //       result = '2';
//   //       print(
//   //           'Failed to send sleep request. Status code: ${response.statusCode}');
//   //     }
//   //   } catch (e) {
//   //     result = '3';
//   //     print('Error occurred while sending sleep request: $e');
//   //   }
//   //   return showDialog<void>(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       if (result == '1') {
//   //         return AlertDialog(
//   //           title: const Center(
//   //             child: Text(
//   //               "Sleep request sent successfully",
//   //               style: TextStyle(color: Colors.blue),
//   //             ),
//   //           ),
//   //         );
//   //       } else {
//   //         return AlertDialog(
//   //           title: const Center(
//   //             child: Text(
//   //               "Failed to send sleep request",
//   //               style: TextStyle(color: Colors.red),
//   //             ),
//   //           ),
//   //         );
//   //       }
//   //     },
//   //   );
//   // }

//   // Future<void> _showDurationPicker() async {
//   //   final int? selectedDuration = await showDialog<int>(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         title: const Text('Select Duration'),
//   //         content: Container(
//   //           height: 200,
//   //           child: Column(
//   //             children: [
//   //               const Text('Enter the sleep duration:'),
//   //               const SizedBox(height: 30),
//   //               Padding(
//   //                 padding:
//   //                     const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//   //                 child: TextField(
//   //                   controller: dateController,
//   //                   decoration: InputDecoration(
//   //                     labelText: 'Select Date',
//   //                     prefixIcon: const Icon(Icons.calendar_month),
//   //                     labelStyle: const TextStyle(fontSize: 20),
//   //                     enabledBorder: OutlineInputBorder(
//   //                       borderRadius: BorderRadius.circular(5),
//   //                       borderSide: const BorderSide(
//   //                         color: borderColor,
//   //                       ),
//   //                     ),
//   //                     focusedBorder: OutlineInputBorder(
//   //                       borderRadius: BorderRadius.circular(5),
//   //                       borderSide: const BorderSide(
//   //                         color: borderColor,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   onTap: () async {
//   //                     final DateTime? pickedDate = await showDatePicker(
//   //                       context: context,
//   //                       initialDate: DateTime.now(),
//   //                       firstDate:
//   //                           DateTime(2000), // allow to choose before today.
//   //                       lastDate: DateTime(2101),
//   //                       builder: (context, child) {
//   //                         return Theme(
//   //                           data: Theme.of(context).copyWith(
//   //                             colorScheme: const ColorScheme.light(
//   //                               primary: Colors.green,
//   //                               onPrimary: Colors.white,
//   //                               onSurface: Colors.black,
//   //                             ),
//   //                             textButtonTheme: TextButtonThemeData(
//   //                               style: TextButton.styleFrom(
//   //                                 elevation: 10,
//   //                                 backgroundColor:
//   //                                     Colors.black, // button text color
//   //                               ),
//   //                             ),
//   //                           ),
//   //                           child: child!,
//   //                         );
//   //                       },
//   //                     );
//   //                     if (pickedDate != null) {
//   //                       String formattedDate =
//   //                           DateFormat('yyyy-MM-dd').format(pickedDate);
//   //                       // DateFormat('dd-MM-yyyy').format(pickedDate);

//   //                       setState(() {
//   //                         dateController.text = formattedDate;
//   //                         // print(dateController.text);
//   //                       });
//   //                     } else {
//   //                       // print("Date is not selected");
//   //                     }
//   //                   },
//   //                 ),
//   //               ),
//   //               const SizedBox(height: 20),
//   //               Padding(
//   //                 padding:
//   //                     const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//   //                 child: TextField(
//   //                   controller: timeinput,
//   //                   decoration: InputDecoration(
//   //                     labelText: 'Select Time',
//   //                     prefixIcon: const Icon(Icons.calendar_month),
//   //                     labelStyle: const TextStyle(fontSize: 20),
//   //                     enabledBorder: OutlineInputBorder(
//   //                       borderRadius: BorderRadius.circular(5),
//   //                       borderSide: const BorderSide(
//   //                         color: borderColor,
//   //                       ),
//   //                     ),
//   //                     focusedBorder: OutlineInputBorder(
//   //                       borderRadius: BorderRadius.circular(5),
//   //                       borderSide: const BorderSide(
//   //                         color: borderColor,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                   onTap: () async {
//   //                     TimeOfDay? pickedTime = await showTimePicker(
//   //                       initialTime: TimeOfDay.now(),
//   //                       context: context,
//   //                       builder: (context, child) {
//   //                         return Theme(
//   //                           data: Theme.of(context).copyWith(
//   //                             colorScheme: const ColorScheme.light(
//   //                               primary: Colors.green,
//   //                               onPrimary: Colors.white,
//   //                               onSurface: Colors.purple,
//   //                             ),
//   //                             textButtonTheme: TextButtonThemeData(
//   //                               style: TextButton.styleFrom(
//   //                                 elevation: 10,
//   //                                 backgroundColor:
//   //                                     Colors.black, // button text color
//   //                               ),
//   //                             ),
//   //                           ),
//   //                           // child: child!,
//   //                           child: MediaQuery(
//   //                             data: MediaQuery.of(context)
//   //                                 .copyWith(alwaysUse24HourFormat: true),
//   //                             child: child ?? Container(),
//   //                           ),
//   //                         );
//   //                       },
//   //                     );

//   //                     if (pickedTime != null) {
//   //                       DateTime parsedTime = DateFormat.jm()
//   //                           .parse(pickedTime.format(context).toString());

//   //                       String formattedTime =
//   //                           DateFormat('HH:mm:ss').format(parsedTime);

//   //                       setState(() {
//   //                         timeinput.text = formattedTime;
//   //                         // print(timeinput.text);
//   //                       });
//   //                     } else {
//   //                       // print("Time is not selected");
//   //                     }
//   //                   },
//   //                 ),
//   //               ),
//   //             ],
//   //           ),
//   //         ),
//   //         actions: [
//   //           TextButton(
//   //             child: const Text('OK'),
//   //             onPressed: () {
//   //               Navigator.of(context).pop(sleepDuration);
//   //             },
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   );

//   //   if (selectedDuration != null) {
//   //     sleepDevice('type', 'deviceID', selectedDuration);
//   //   }
//   // }

//   // Future<void> modeDevice(String deviceId, String status) {
//   //   return showDialog<void>(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         title: Text('Select Action'),
//   //         content: Text('Choose an option:'),
//   //         actions: [
//   //           TextButton(
//   //             child: Text('Reboot', style: TextStyle(color: Colors.green)),
//   //             onPressed: () {
//   //               rebootDevice('$deviceId', '$status');
//   //               Navigator.of(context).pop();
//   //             },
//   //           ),
//   //           TextButton(
//   //             child: Text('Sleep', style: TextStyle(color: Colors.green)),
//   //             onPressed: () {
//   //               Navigator.of(context).pop();
//   //               _showDurationPicker();
//   //             },
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   );
//   // }
//   // Future<void> Delete_device(String deviceId) async {
//   //   final url = Uri.https(
//   //     'z29tdyfh2h.execute-api.us-east-1.amazonaws.com',
//   //     '/remove/remove-device',
//   //     {
//   //       'deviceid': deviceId,
//   //     },
//   //   );
//   //   final response = await http.get(url);
//   //   var decoded = jsonDecode(response.body);
//   //   if (response.statusCode == 200) {
//   //     print(decoded);
//   //     print(decoded['body']['message']);
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(
//   //         content: Text(decoded['body']['message']),
//   //         duration: Duration(seconds: 3),
//   //         backgroundColor: Colors.green,
//   //       ),
//   //     );
//   //   } else {
//   //     throw Exception('Failed to load api');
//   //   }
//   // }

//   // Future<void> _dialogbox(BuildContext context, String device_id) {
//   //   return showDialog<void>(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         title: const Center(
//   //             child: Text(
//   //           'Are you sure!! You want to DELETE?? ',
//   //           style: TextStyle(color: buttonColor),
//   //         )),
//   //         actions: <Widget>[
//   //           MaterialButton(
//   //             textColor: Colors.white,
//   //             color: Colors.red,
//   //             child: const Text('Cancel'),
//   //             onPressed: () {
//   //               Navigator.of(context).pop();
//   //             },
//   //           ),
//   //           MaterialButton(
//   //             textColor: Colors.white,
//   //             color: buttonColor,
//   //             child: const Text('Delete'),
//   //             onPressed: () {
//   //               Delete_device(device_id);
//   //               Navigator.of(context).pop();
//   //               // },
//   //               // Delete_device(
//   //               //   'deviceid':$
//   //               // );
//   //               // Navigator.of(context).pop();
//   //             },
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   );
//   // }
// // {email: milanpreetkaur502@gmail.com, serialID: D0314, deviceBooted: true, deviceProvisoned: true}
// //change check
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: buttonColor,
//         title: Row(
//           children: [
//             const Icon(
//               Icons.dashboard,
//               size: 35,
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Text('Biodiversity Sensor Console')
//           ],
//         ),
//         // centerTitle: true,
//         // actions: [
//         //   Padding(
//         //     padding: const EdgeInsets.only(right: 20, top: 8, bottom: 10),
//         //     child: ElevatedButton.icon(
//         //       onPressed: () {
//         //         Navigator.of(context).pushReplacement(
//         //             MaterialPageRoute(builder: (context) => const Login()));
//         //         setState(() {
//         //           // deviceData = [];
//         //         });
//         //       },
//         //       // icon: const Icon(
//         //       //   Icons.logout,
//         //       //   color: backgroundColor,
//         //       // ),
//         //       // label: const Text(
//         //       //   'LOG OUT',
//         //       //   style: TextStyle(fontWeight: FontWeight.bold),
//         //       // ),
//         //       // style: ElevatedButton.styleFrom(
//         //       //     // elevation: 10,
//         //       //     backgroundColor: Colors.white10),
//         //     ),
//         //   )
//         // ],
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Container(
//             margin: EdgeInsets.only(left: 2),
//             padding: EdgeInsets.only(left: 30),
//             child: FloatingActionButton.extended(
//                 heroTag: 'btn3',
//                 backgroundColor: buttonColor,
//                 onPressed: () => _filter(context),
//                 label: const Text('Countries')),
//           ),
//           // Padding(
//           //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
//           // ),
//           FloatingActionButton.extended(
//               heroTag: 'btn3',
//               backgroundColor: buttonColor,
//               onPressed: () => _dialogBuilder(context),
//               label: const Text('Register a new Device +')),
//         ],
//       ),
//       body: FutureBuilder<String>(
//         future: response,
//         builder: ((context, snapshot) {
//           if (snapshot.hasData) {
//             if (snapshot.data == '200') {
//               // print(data);
//               return ListView(
//                 children: [
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
//                     child: Container(
//                       height: 50,
//                       decoration: const BoxDecoration(
//                         color: buttonColor,
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                       ),
//                       alignment: Alignment.center,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 10, vertical: 0),
//                         child: Table(
//                           columnWidths: const {
//                             0: FractionColumnWidth(0.18),
//                             1: FractionColumnWidth(0.17),
//                             2: FractionColumnWidth(0.16),
//                             3: FractionColumnWidth(0.16),
//                             4: FractionColumnWidth(0.16),
//                             5: FractionColumnWidth(0.17)
//                             // 6: FractionColumnWidth(0.14),
//                           },
//                           children: const <TableRow>[
//                             TableRow(children: <Widget>[
//                               Center(
//                                 child: Text(
//                                   'S.NO',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                       color: backgroundColor),
//                                 ),
//                               ),
//                               Center(
//                                 child: Text(
//                                   'DEVICE ID',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                       color: backgroundColor),
//                                 ),
//                               ),
//                               Center(
//                                 child: Text(
//                                   'BOOT STATUS',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                       color: backgroundColor),
//                                 ),
//                               ),
//                               // Center(
//                               //   child: Text(
//                               //     'REGISTERED',
//                               //     style: TextStyle(
//                               //         fontWeight: FontWeight.bold,
//                               //         fontSize: 16,
//                               //         color: backgroundColor),
//                               //   ),
//                               // ),
//                               // Center(
//                               //   child: Text(
//                               //     'CONFIGURE',
//                               //     style: TextStyle(
//                               //         fontWeight: FontWeight.bold,
//                               //         fontSize: 16,
//                               //         color: backgroundColor),
//                               //   ),
//                               // ),
//                               // Center(
//                               //   child: Text(
//                               //     'DOWNLOAD',
//                               //     style: TextStyle(
//                               //         fontWeight: FontWeight.bold,
//                               //         fontSize: 16,
//                               //         color: backgroundColor),
//                               //   ),
//                               // ),
//                               Center(
//                                 child: Text(
//                                   'Weather Data',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                       color: backgroundColor),
//                                 ),
//                               ),
//                               // Center(
//                               //   child: Text(
//                               //     'Motion Count',
//                               //     style: TextStyle(
//                               //         fontWeight: FontWeight.bold,
//                               //         fontSize: 16,
//                               //         color: backgroundColor),
//                               //   ),
//                               // ),
//                               Center(
//                                 child: Text(
//                                   'Insect Count',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                       color: backgroundColor),
//                                 ),
//                               ),
//                               Center(
//                                 child: Text(
//                                   'Image',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                       color: backgroundColor),
//                                 ),
//                               ),
//                               // Center(
//                               //   child: Text(
//                               //     '',
//                               //     style: TextStyle(
//                               //         fontWeight: FontWeight.bold,
//                               //         fontSize: 16,
//                               //         color: backgroundColor),
//                               //   ),
//                               // ),
//                             ]),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   for (int i = 0; i < deviceData.length; i++)
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 2),
//                       child: Container(
//                         height: 50,
//                         decoration: const BoxDecoration(
//                           color: buttonColor,
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(10),
//                           ),
//                         ),
//                         alignment: Alignment.center,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 30, vertical: 0),
//                           child: Table(
//                             columnWidths: const {
//                               0: FractionColumnWidth(0.10),
//                               1: FractionColumnWidth(0.10),
//                               2: FractionColumnWidth(0.10),
//                               3: FractionColumnWidth(0.10),
//                               4: FractionColumnWidth(0.10),
//                               5: FractionColumnWidth(0.10),
//                               6: FractionColumnWidth(0.10)
//                               // 6: FractionColumnWidth(0.14)
//                             },
//                             children: [
//                               TableRow(children: [
//                                 SizedBox(
//                                   height: 40,
//                                   child: Center(
//                                     child: Text(
//                                       '${i + 1}',
//                                       style: const TextStyle(
//                                           fontSize: 16, color: backgroundColor),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 40,
//                                   child: Center(
//                                     child: Text(
//                                       deviceData[i].deviceId,
//                                       style: const TextStyle(
//                                           fontSize: 16, color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 40,
//                                   child: Center(
//                                     child: Text(
//                                       deviceData[i].status,
//                                       style: const TextStyle(
//                                           fontSize: 16, color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                                 // SizedBox(
//                                 //   height: 40,
//                                 //   child: Center(
//                                 //     child: Text(
//                                 //       '${deviceData[i].registerStatus}',
//                                 //       style: const TextStyle(
//                                 //           fontSize: 16, color: Colors.white),
//                                 //     ),
//                                 //   ),
//                                 // ),
//                                 // SizedBox(
//                                 //   height: 40,
//                                 //   child: Center(
//                                 //     child: IconButton(
//                                 //       onPressed: () {
//                                 //         // print('CONFIGURE');
//                                 //         Navigator.of(context).push(
//                                 //           MaterialPageRoute(
//                                 //             builder: (_) => ConfigScreen(
//                                 //               deviceId: deviceData[i].deviceId,
//                                 //               userName: widget.email,
//                                 //             ),
//                                 //           ),
//                                 //         );
//                                 //       },
//                                 //       icon: const Icon(
//                                 //         Icons.settings,
//                                 //         color: backgroundColor,
//                                 //       ),
//                                 //       // label: const Text('CONFIGURE'),
//                                 //       style: ElevatedButton.styleFrom(
//                                 //           // elevation: 10,
//                                 //           backgroundColor: Colors.white10),
//                                 //     ),
//                                 //   ),
//                                 // ),
//                                 // SizedBox(
//                                 //   height: 40,
//                                 //   child: Center(
//                                 //     child: IconButton(
//                                 //       onPressed: () {
//                                 //         Navigator.of(context).push(
//                                 //           MaterialPageRoute(
//                                 //             builder: (_) => DeviceScreen(
//                                 //               deviceId: deviceData[i].deviceId,
//                                 //             ),
//                                 //           ),
//                                 //         );
//                                 //       },
//                                 //       icon: const Icon(
//                                 //         Icons.download,
//                                 //         color: backgroundColor,
//                                 //       ),
//                                 //       // label: const Text('DOWNLOAD'),
//                                 //       style: ElevatedButton.styleFrom(
//                                 //           // elevation: 10,
//                                 //           backgroundColor: Colors.white10),
//                                 //     ),
//                                 //   ),
//                                 // ),
//                                 SizedBox(
//                                   height: 40,
//                                   child: Center(
//                                     child: IconButton(
//                                       onPressed: () {
//                                         // print('Status');
//                                         Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                             builder: (_) => Weather(
//                                               // values: [],
//                                               deviceId: deviceData[i].deviceId,
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                       icon: const Icon(
//                                         Icons.cloud,
//                                         color: backgroundColor,
//                                       ),
//                                       // label: const Text('TempDB Data'),
//                                       style: ElevatedButton.styleFrom(
//                                           // elevation: 10,
//                                           backgroundColor: Colors.white10),
//                                     ),
//                                   ),
//                                 ),
//                                 // SizedBox(
//                                 //   height: 40,
//                                 //   child: Center(
//                                 //     child: IconButton(
//                                 //       onPressed: () {
//                                 //         // print('Insect');
//                                 //         Navigator.of(context).push(
//                                 //           MaterialPageRoute(
//                                 //             builder: (_) => Insects(
//                                 //               // values: [],
//                                 //               deviceId: deviceData[i].deviceId,
//                                 //             ),
//                                 //           ),
//                                 //         );
//                                 //       },
//                                 //       icon: const Icon(
//                                 //         Icons.bug_report_rounded,
//                                 //         color: backgroundColor,
//                                 //       ),
//                                 //       // label: const Text('InsectCount Data'),
//                                 //       style: ElevatedButton.styleFrom(
//                                 //           // elevation: 10,
//                                 //           backgroundColor: Colors.white10),
//                                 //     ),
//                                 //   ),
//                                 // ),
//                                 SizedBox(
//                                   height: 40,
//                                   child: Center(
//                                     child: IconButton(
//                                       onPressed: () {
//                                         // print('Inference');
//                                         Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                             builder: (_) => Inference(
//                                               // values: [],
//                                               deviceId: deviceData[i].deviceId,
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                       icon: const Icon(
//                                         Icons.insert_chart,
//                                         color: backgroundColor,
//                                       ),
//                                       // label: const Text('Inferenced Data'),
//                                       style: ElevatedButton.styleFrom(
//                                           // elevation: 10,
//                                           backgroundColor: Colors.white10),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 40,
//                                   child: Center(
//                                     child: IconButton(
//                                       onPressed: () {
//                                         // print('Status');
//                                         Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                             builder: (_) => Pictures(
//                                               deviceId: deviceData[i].deviceId,
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                       icon: const Icon(
//                                         Icons.image,
//                                         color: backgroundColor,
//                                       ),
//                                       // label: const Text('TempDB Data'),
//                                       style: ElevatedButton.styleFrom(
//                                           // elevation: 10,
//                                           backgroundColor: Colors.white10),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 40,
//                                   child: Center(
//                                     child: IconButton(
//                                       onPressed: () {
//                                         // print('Inference');
//                                         Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                             builder: (_) => Battery(
//                                               // values: [],
//                                               deviceId: deviceData[i].deviceId,
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                       icon: const Icon(
//                                         Icons.battery_6_bar,
//                                         color: backgroundColor,
//                                       ),
//                                       // label: const Text('Inferenced Data'),
//                                       style: ElevatedButton.styleFrom(
//                                           // elevation: 10,
//                                           backgroundColor: Colors.white10),
//                                     ),
//                                   ),
//                                 ),
//                                 // SizedBox(
//                                 //   height: 40,
//                                 //   child: Center(
//                                 //     child: Tooltip(
//                                 //         message: "battery",
//                                 //         child: MouseRegion(
//                                 //           onEnter: (_) {
//                                 //             setState(() {
//                                 //               _hovering = true;
//                                 //             });
//                                 //           },
//                                 //           onExit: (_) {
//                                 //             setState(() {
//                                 //               _hovering = false;
//                                 //             });
//                                 //           },
//                                 //           child: Row(
//                                 //             mainAxisAlignment:
//                                 //                 MainAxisAlignment.center,
//                                 //             children: [
//                                 //               Icon(
//                                 //                 _hovering
//                                 //                     ? (condition
//                                 //                         ? Icons.battery_saver
//                                 //                         : Icons.battery_full)
//                                 //                     : null,
//                                 //                 size: 20.0,
//                                 //                 color: Colors.white,
//                                 //               ),
//                                 //               _hovering
//                                 //                   ? Text('30%',
//                                 //                       style: TextStyle(
//                                 //                           color: Colors.white,
//                                 //                           fontSize: 12))
//                                 //                   : Text(""),
//                                 //             ],
//                                 //           ),
//                                 //         )),
//                                 //   ),
//                                 // )

//                                 // SizedBox(
//                                 //   height: 40,
//                                 //   child: Center(
//                                 //     child: IconButton(
//                                 //       onPressed: () {
//                                 //         // print('Insect');
//                                 //         Navigator.of(context).push(
//                                 //           MaterialPageRoute(
//                                 //             builder: (_) => Insects(
//                                 //               // values: [],
//                                 //               deviceId: deviceData[i].deviceId,
//                                 //             ),
//                                 //           ),
//                                 //         );
//                                 //       },
//                                 //       icon: const Icon(
//                                 //         Icons.bug_report_rounded,
//                                 //         color: backgroundColor,
//                                 //       ),
//                                 //       // label: const Text('InsectCount Data'),
//                                 //       style: ElevatedButton.styleFrom(
//                                 //           // elevation: 10,
//                                 //           backgroundColor: Colors.white10),
//                                 //     ),
//                                 //   ),
//                                 // ),
//                                 // SizedBox(
//                                 //   height: 40,
//                                 //   child: Center(
//                                 //     child: Tooltip(
//                                 //         message: "Delete",
//                                 //         child: MouseRegion(
//                                 //           onEnter: (_) {
//                                 //             setState(() {
//                                 //               _hovering = true;
//                                 //             });
//                                 //           },
//                                 //           onExit: (_) {
//                                 //             setState(() {
//                                 //               _hovering = false;
//                                 //             });
//                                 //           },
//                                 //           child: _hovering
//                                 //               ? IconButton(
//                                 //                   onPressed: () => _dialogbox(
//                                 //                       context,
//                                 //                       deviceData[i].deviceId),
//                                 //                   icon: const Icon(
//                                 //                     Icons.close,
//                                 //                     color: backgroundColor,
//                                 //                   ),
//                                 //                   style:
//                                 //                       ElevatedButton.styleFrom(
//                                 //                           backgroundColor:
//                                 //                               Colors.white10),
//                                 //                 )
//                                 //               : null,
//                                 //         )),
//                                 //     // child: IconButton(
//                                 //     //   onPressed: () => _dialogbox(context),
//                                 //     //   icon: const Icon(
//                                 //     //     Icons.delete,
//                                 //     //     color: backgroundColor,
//                                 //     //   ),
//                                 //     //   style: ElevatedButton.styleFrom(
//                                 //     //       backgroundColor: Colors.white10),
//                                 //     // ),
//                                 //   ),
//                                 // )
//                                 // SizedBox(
//                                 //   height: 40,
//                                 //   child: Center(
//                                 //     child: Tooltip(
//                                 //         message: "battery",
//                                 //         child: MouseRegion(
//                                 //           onEnter: (_) {
//                                 //             setState(() {
//                                 //               _hovering = true;
//                                 //             });
//                                 //           },
//                                 //           onExit: (_) {
//                                 //             setState(() {
//                                 //               _hovering = false;
//                                 //             });
//                                 //           },
//                                 //           child: Row(
//                                 //             mainAxisAlignment:
//                                 //                 MainAxisAlignment.center,
//                                 //             children: [
//                                 //               Icon(
//                                 //                 _hovering
//                                 //                     ? (condition
//                                 //                         ? Icons.battery_saver
//                                 //                         : Icons.battery_full)
//                                 //                     : null,
//                                 //                 size: 20.0,
//                                 //                 color: Colors.white,
//                                 //               ),
//                                 //               _hovering
//                                 //                   ? Text('30%',
//                                 //                       style: TextStyle(
//                                 //                           color: Colors.white,
//                                 //                           fontSize: 12))
//                                 //                   : Text(""),
//                                 //             ],
//                                 //           ),
//                                 //         )),
//                                 //   ),
//                                 // )
//                               ]),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                 ],
//               );
//             }
//             return Container();
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('${snapshot.error}'),
//             );
//           }
//           return const Center(
//               child: CircularProgressIndicator(
//             color: Colors.green,
//           ));
//         }),
//       ),
//     );
//   }
// }

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
import 'dart:convert';
import 'package:detest/Image_download.dart';
import 'package:detest/Inferenced_Data copy.dart';
import 'package:detest/country/FranceNew.dart';
import 'package:detest/country/Germany.dart';
import 'package:detest/country/GermanyDeployment.dart';
import 'package:detest/country/Portugal.dart';
import 'package:detest/country/Spain.dart';
import 'package:detest/country/Switzerland.dart';
import 'package:detest/country/UKDeployment.dart';
import 'package:detest/country/USADeployment.dart';
import 'package:detest/country/UkData.dart';
import 'package:detest/country/UsaData.dart';
import 'package:detest/country/_France.dart';
import 'package:detest/country/India.dart';
import 'package:detest/country/franceDeploymant.dart';
import 'package:detest/country/lab.dart';
import 'package:detest/country/oldDevice.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:detest/device_screen.dart';
import 'package:detest/login.dart';
import 'package:detest/text_input_field.dart';
import 'package:flutter/material.dart';
import 'config_screen.dart';
import 'constant.dart';
import 'package:detest/weatherData.dart';
import 'package:detest/insectCount.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:intl/intl.dart';
import 'country/Australia.dart';
import 'filteredData.dart';
// import 'package:detest/Battery.dart';
import 'birdNet.dart';
import 'package:detest/country/oldDevice.dart';

class HomeScreen extends StatefulWidget {
  final String email;

  const HomeScreen({super.key, required this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<String> response;
  late TextEditingController _serialId;
  late TextEditingController _securityKey;
  late TextEditingController dateController;
  late TextEditingController timeinput;
  late String result;
  void selectedCountry = "";
  late int sleepDuration = 0;

  TextEditingController _searchController = TextEditingController();
  List<Device> filteredDeviceData = [];

  bool _hovering = false;
  bool condition = false;
  @override
  void initState() {
    response = getData(widget.email);
    _serialId = TextEditingController();
    _securityKey = TextEditingController();
    dateController = TextEditingController();
    timeinput = TextEditingController();

    _searchController.addListener(_filterDevices);
    super.initState();
  }

  @override
  void dispose() {
    _serialId.dispose();
    _securityKey.dispose();

    _searchController.dispose();
    super.dispose();
  }

  void _filterDevices() {
    setState(() {
      filteredDeviceData = deviceData
          .where((device) => device.deviceId
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  Future<void> _filter(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Center(
                child: Text(
              'Select a Country',
              style: TextStyle(color: buttonColor),
            )),
            content: SizedBox(
              height: 700,
              width: 400,
              child: Column(
                children: [
                  const SizedBox(height: 1),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  const SizedBox(height: 13),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GermanyPage()),
                          );
                        });
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: backgroundColor,
                      ),
                      label: const Text(
                        'Germany',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          // elevation: 10,
                          backgroundColor: Color.fromARGB(164, 14, 211, 7)),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SwitzerlandScreen()),
                          );
                        });
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: backgroundColor,
                      ),
                      label: const Text(
                        'Switzerland',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          // elevation: 10,
                          backgroundColor: Color.fromARGB(164, 14, 211, 7)),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AustraliaScreen()),
                          );
                        });
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: backgroundColor,
                      ),
                      label: const Text(
                        'Australia',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          // elevation: 10,
                          backgroundColor: Color.fromARGB(164, 14, 211, 7)),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SpainScreen()),
                          );
                        });
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: backgroundColor,
                      ),
                      label: const Text(
                        'Spain',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          // elevation: 10,
                          backgroundColor: Color.fromARGB(164, 14, 211, 7)),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FrancePage()),
                          );
                        });
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: backgroundColor,
                      ),
                      label: const Text(
                        'France',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          // elevation: 10,
                          backgroundColor: Color.fromARGB(164, 14, 211, 7)),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UKPage()),
                          );
                        });
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: backgroundColor,
                      ),
                      label: const Text(
                        'UK',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          // elevation: 10,
                          backgroundColor: Color.fromARGB(164, 14, 211, 7)),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PortutgalScreen()),
                          );
                        });
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: backgroundColor,
                      ),
                      label: const Text(
                        'Portugal',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          // elevation: 10,
                          backgroundColor: Color.fromARGB(164, 14, 211, 7)),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => USAPage()),
                          );
                        });
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: backgroundColor,
                      ),
                      label: const Text(
                        'USA',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          // elevation: 10,
                          backgroundColor: Color.fromARGB(164, 14, 211, 7)),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => INDIA_Screen()),
                          );
                        });
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: backgroundColor,
                      ),
                      label: const Text(
                        'INDIA',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          // elevation: 10,
                          backgroundColor: Color.fromARGB(164, 14, 211, 7)),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LabScreen()),
                          );
                        });
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: backgroundColor,
                      ),
                      label: const Text(
                        'Lab',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          // elevation: 10,
                          backgroundColor: Color.fromARGB(164, 14, 211, 7)),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                textColor: Colors.white,
                color: Colors.red,
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ]);
      },
    );
  }

  void _openBirdNetDialog(BuildContext context) {
    String enteredDeviceId = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Enter Device ID',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.green,
            ),
          ),
          content: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: TextField(
              onChanged: (value) {
                enteredDeviceId = value;
              },
              decoration: InputDecoration(
                hintText: 'S01',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (enteredDeviceId.isEmpty) {
                  enteredDeviceId = 'S01'; // Default value
                }
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => birdNet(deviceId: enteredDeviceId),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: Text('Next'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: buttonColor,
        title: Row(
          children: [
            const Icon(
              Icons.dashboard,
              size: 35,
            ),
            const SizedBox(
              width: 10,
            ),
            Text('Biodiversity Sensor Console'),
          ],
        ),
        actions: [
          Container(
            width: 200,
            height: 50,
            margin: EdgeInsets.only(bottom: 1, top: 5),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Device ID',
                fillColor: Colors.transparent,
                hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                filled: true,
              ),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              _openBirdNetDialog(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: Text(
              "Bird-Tunes",
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            width: 30,
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 2),
            padding: EdgeInsets.only(left: 30),
            child: FloatingActionButton.extended(
                heroTag: 'btn3',
                backgroundColor: buttonColor,
                onPressed: () => _filter(context),
                label: const Text('Countries')),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => oldScreen()),
                );
              });
            },
            child: Text("Old Devices"),
            style: ElevatedButton.styleFrom(
                // elevation: 10,
                backgroundColor: buttonColor),
          ),
        ],
      ),
      body: FutureBuilder<String>(
        future: response,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == '200') {
              filteredDeviceData = filteredDeviceData.isNotEmpty
                  ? filteredDeviceData
                  : deviceData
                      .where((device) => device.deviceId.length != 5)
                      .toList();
              return ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: Table(
                          columnWidths: const {
                            0: FractionColumnWidth(0.15),
                            1: FractionColumnWidth(0.15),
                            2: FractionColumnWidth(0.18),
                            3: FractionColumnWidth(0.18),
                            // 4: FractionColumnWidth(0.15),
                            4: FractionColumnWidth(0.18)
                            // 6: FractionColumnWidth(0.18)
                          },
                          children: const <TableRow>[
                            TableRow(children: <Widget>[
                              Center(
                                child: Text(
                                  'Serial No',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: backgroundColor),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Device ID',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: backgroundColor),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Boot Status',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: backgroundColor),
                                ),
                              ),
                              // Center(
                              //   child: Text(
                              //     'Weather Data',
                              //     style: TextStyle(
                              //         fontWeight: FontWeight.bold,
                              //         fontSize: 16,
                              //         color: backgroundColor),
                              //   ),
                              // ),
                              Center(
                                child: Text(
                                  'Insect Count',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: backgroundColor),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Images',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: backgroundColor),
                                ),
                              ),
                              // Center(
                              //   child: Text(
                              //     'Battery',
                              //     style: TextStyle(
                              //         fontWeight: FontWeight.bold,
                              //         fontSize: 16,
                              //         color: backgroundColor),
                              //   ),
                              // ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                  for (int i = 0; i < filteredDeviceData.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 0),
                          child: Table(
                            columnWidths: const {
                              0: FractionColumnWidth(0.15),
                              1: FractionColumnWidth(0.15),
                              2: FractionColumnWidth(0.18),
                              3: FractionColumnWidth(0.18),
                              // 4: FractionColumnWidth(0.15),
                              4: FractionColumnWidth(0.18)
                              // 6: FractionColumnWidth(0.18)
                            },
                            children: [
                              TableRow(children: [
                                SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      '${i + 1}',
                                      style: const TextStyle(
                                          fontSize: 16, color: backgroundColor),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      filteredDeviceData[i].deviceId,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: Tooltip(
                                      message:
                                          'Last Active: ${filteredDeviceData[i].lastActive}',
                                      child: Text(
                                        filteredDeviceData[i].status,
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   height: 40,
                                //   child: Center(
                                //     child: IconButton(
                                //       onPressed: () {
                                //         Navigator.of(context).push(
                                //           MaterialPageRoute(
                                //             builder: (_) => Weather(
                                //               deviceId: filteredDeviceData[i]
                                //                   .deviceId,
                                //             ),
                                //           ),
                                //         );
                                //       },
                                //       icon: const Icon(
                                //         Icons.cloud,
                                //         color: backgroundColor,
                                //       ),
                                //       style: ElevatedButton.styleFrom(
                                //           backgroundColor: Colors.white10),
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) => Inference(
                                              deviceId: filteredDeviceData[i]
                                                  .deviceId,
                                            ),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.insert_chart,
                                        color: backgroundColor,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) => Pictures(
                                              deviceId: filteredDeviceData[i]
                                                  .deviceId,
                                            ),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.image,
                                        color: backgroundColor,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white10),
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   height: 40,
                                //   child: Center(
                                //     child: Row(
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.center,
                                //       children: [
                                //         IconButton(
                                //           onPressed: () {
                                //             Navigator.of(context).push(
                                //               MaterialPageRoute(
                                //                 builder: (_) => Battery(
                                //                   deviceId:
                                //                       filteredDeviceData[i]
                                //                           .deviceId,
                                //                 ),
                                //               ),
                                //             );
                                //           },
                                //           icon: const Icon(
                                //             Icons.battery_6_bar,
                                //             color: backgroundColor,
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              );
            }
            return Container();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        }),
      ),
    );
  }
}
