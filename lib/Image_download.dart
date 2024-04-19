// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// class Pictures extends StatefulWidget {
//   final String deviceId;

//   const Pictures({
//     super.key,
//     required this.deviceId,
//   });

//   @override
//   State<Pictures> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<Pictures> {
//   late DateTime _date;
//   List<String> imageUrls = [];
//   String errorMessage = '';

//   @override
//   void initState() {
//     super.initState();
//     _date = DateTime.parse(DateTime.now().toString());
//   }

//   Future<void> getImage(
//     String device,
//     DateTime _date,
//   ) async {
//     final response = await http.get(
//         Uri.https(
//           'tulp6xq61c.execute-api.us-east-1.amazonaws.com',
//           '/dep/images',
//           {
//             'device': device,
//             'date': _date.day.toString() +
//                 "-" +
//                 _date.month.toString() +
//                 "-" +
//                 _date.year.toString(),
//           },
//         )
//       );

//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = json.decode(response.body);
//       List<dynamic> images = json.decode(data['body'])['images'];

//       setState(() {
//         imageUrls = List<String>.from(images);
//       });
//     } else {
//       // Handle error
//       print('Failed to load images');
//     }
//   }

//   void updateData() {
//     getImage(widget.deviceId, _date);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Images for ' + widget.deviceId,
//           style: TextStyle(
//             fontSize: 20.0,
//             letterSpacing: 1.0,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.green,
//         elevation: 0.0,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Container(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         onTap: () async {
//                           final DateTime? selectedDate = await showDatePicker(
//                             context: context,
//                             initialDate: _date ?? DateTime.now(),
//                             firstDate: DateTime(1900),
//                             lastDate: DateTime.now(),
//                             builder: (context, child) {
//                               return Theme(
//                                 data: Theme.of(context).copyWith(
//                                   colorScheme: const ColorScheme.light(
//                                     primary: Colors.green,
//                                     onPrimary: Colors.white,
//                                     onSurface: Colors.purple,
//                                   ),
//                                   textButtonTheme: TextButtonThemeData(
//                                     style: TextButton.styleFrom(
//                                       elevation: 10,
//                                       backgroundColor:
//                                           Colors.black, // button text color
//                                     ),
//                                   ),
//                                 ),
//                                 // child: child!,
//                                 child: MediaQuery(
//                                   data: MediaQuery.of(context)
//                                       .copyWith(alwaysUse24HourFormat: true),
//                                   child: child ?? Container(),
//                                 ),
//                               );
//                             },
//                           );
//                           if (selectedDate != null) {
//                             setState(() {
//                               _date = selectedDate;
//                             });
//                           }
//                         },
//                         decoration: InputDecoration(
//                           labelText: 'Select Date',
//                           border: OutlineInputBorder(),
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 12, horizontal: 16),
//                         ),
//                         controller: TextEditingController(
//                             text: _date != null
//                                 ? DateFormat('dd-MM-yyyy').format(_date)
//                                 : ''),
//                       ),
//                     ),
//                     SizedBox(width: 16.0),
//                     ElevatedButton(
//                       onPressed: () {
//                         updateData();
//                       },
//                       child: Text(
//                         'Get IMAGES',
//                         style: TextStyle(
//                           fontSize: 20,
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.green, // Set the button color to green
//                         minimumSize:
//                             Size(80, 0), // Set a minimum width for the button
//                         padding:
//                             EdgeInsets.symmetric(vertical: 20, horizontal: 24),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 16.0),
//                     ElevatedButton(
//                       onPressed: () {},
//                       child: Text(
//                         'Download IMAGES',
//                         style: TextStyle(
//                           fontSize: 20,
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.green, // Set the button color to green
//                         minimumSize:
//                             Size(80, 0), // Set a minimum width for the button
//                         padding:
//                             EdgeInsets.symmetric(vertical: 20, horizontal: 24),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 32.0),
//                 Expanded(
//                   child: Center(
//                     child: ListView.builder(
//                       itemCount: imageUrls.length,
//                       itemBuilder: (context, index) {
//                         return Image.network(imageUrls[index]);
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
//
// class Pictures extends StatelessWidget {
//   final List<String> imageURls = [
//     "https://tulp6xq61c.execute-api.us-east-1.amazonaws.com/dep/images?device=02&date=23-01-2024",
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Images for ',
//           style: TextStyle(
//             fontSize: 20.0,
//             letterSpacing: 1.0,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.green,
//         elevation: 0.0,
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         itemCount: imageURls.length,
//         itemBuilder: (context, index) {
//           return Image.network(imageURls[index]);
//         },
//       ),
//     );
//   }
// }

//
//
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class Pictures extends StatefulWidget {
//   @override
//   _PicturesState createState() => _PicturesState();
// }
//
// class _PicturesState extends State<Pictures> {
//   final String apiUrl =
//       'https://tulp6xq61c.execute-api.us-east-1.amazonaws.com/dep/images?device=02&date=23-02-2024';
//
//   List<String> imageUrls = [];
//   int batchSize = 10;
//   int currentPage = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Download'),
//       ),
//       body: FutureBuilder<List<String>>(
//         future: fetchImages(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Text('No images available.');
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 return Image.network(snapshot.data![index]);
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   Future<List<String>> fetchImages() async {
//     final response = await http.get(Uri.parse(apiUrl));
//     List<String> currentBatch = [];
//
//     if (response.statusCode == 200) {
//       final bodyJson = json.decode(response.body);
//       final images = json.decode(bodyJson['body'])['images'];
//
//       // Extract image URLs
//       for (int i = currentPage * batchSize;
//       i < (currentPage + 1) * batchSize && i < images.length;
//       i++) {
//         currentBatch.add(images[i]);
//       }
//
//       // Increment current page for next batch
//       currentPage++;
//
//       // Update the list of image URLs
//       imageUrls.addAll(currentBatch);
//     } else {
//       throw Exception('Failed to load images');
//     }
//
//     return imageUrls;
//   }
// }

//---------------------------------------------tested ok by Sarthak------------------------
//
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class Pictures extends StatefulWidget {
//   @override
//   _PicturesState createState() => _PicturesState();
// }
//
// class _PicturesState extends State<Pictures> {
//   final String apiUrl =
//       'https://tulp6xq61c.execute-api.us-east-1.amazonaws.com/dep/images?device=02&date=23-02-2024';
//
//   List<String> imageUrls = [];
//   int batchSize = 10;
//   int currentPage = 0;
//
//   bool isLoading = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Download'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: isLoading
//                 ? FutureBuilder<List<String>>(
//               future: fetchImages(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return Text('Loading...');
//                 } else {
//                   return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) {
//                       return Image.network(snapshot.data![index]);
//                     },
//                   );
//                 }
//               },
//             )
//                 : ListView.builder(
//               itemCount: imageUrls.length,
//               itemBuilder: (context, index) {
//                 return Image.network(imageUrls[index]);
//               },
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: currentPage > 0 ? moveToPreviousPage : null,
//                 child: Text('Previous'),
//               ),
//               SizedBox(width: 16),
//               ElevatedButton(
//                 onPressed: moveToNextPage,
//                 child: Text('Next'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<List<String>> fetchImages() async {
//     final response = await http.get(Uri.parse(apiUrl));
//     List<String> currentBatch = [];
//
//     if (response.statusCode == 200) {
//       final bodyJson = json.decode(response.body);
//       final images = json.decode(bodyJson['body'])['images'];
//
//       // Extract image URLs
//       for (int i = currentPage * batchSize;
//       i < (currentPage + 1) * batchSize && i < images.length;
//       i++) {
//         currentBatch.add(images[i]);
//       }
//
//       // Update the list of image URLs
//       imageUrls = currentBatch;
//     } else {
//       throw Exception('Failed to load images');
//     }
//
//     // Show loading text for a short duration
//     Future.delayed(Duration(milliseconds: 500), () {
//       setState(() {
//         isLoading = false;
//       });
//     });
//
//     return imageUrls;
//   }
//
//   void moveToNextPage() {
//     setState(() {
//       currentPage++;
//       isLoading = true;
//     });
//   }
//
//   void moveToPreviousPage() {
//     setState(() {
//       currentPage--;
//       isLoading = true;
//     });
//   }
// }

// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class Pictures extends StatefulWidget {
//   final String deviceId;
//   const Pictures({super.key, required this.deviceId});
//   @override
//   _PicturesState createState() => _PicturesState();
// }

// class _PicturesState extends State<Pictures> {
//   // final String apiUrl =
//   //     'https://tulp6xq61c.execute-api.us-east-1.amazonaws.com/dep/images?device=02&date=23-02-2024';

//   List<String> imageUrls = [];
//   int batchSize = 10;
//   int currentPage = 0;
//   DateTime selectedDate = DateTime.now();

//   bool isLoading = true;

//   var _startDate;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Image Data for ' + widget.deviceId,
//           style: TextStyle(
//             fontSize: 20.0,
//             letterSpacing: 1.0,
//             color: Colors.white,
//           ),
//         ),
//         // actions: [
//         //   PopupMenuButton<String>(
//         //     onSelected: (value) => onDownloadOptionSelected(value),
//         //     itemBuilder: (BuildContext context) {
//         //       return ['Download Current Batch', 'Download All Images']
//         //           .map((String choice) {
//         //         return PopupMenuItem<String>(
//         //           value: choice,
//         //           child: Text(choice),
//         //         );
//         //       }).toList();
//         //     },
//         //   ),
//         // ],
//         backgroundColor: Colors.green,
//         elevation: 0.0,
//         centerTitle: true,
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextFormField(
//               onTap: () => _selectDate(context),
//               decoration: InputDecoration(
//                 labelText: 'Select Date',
//                 border: OutlineInputBorder(),
//                 contentPadding:
//                     EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//               ),
//               controller: TextEditingController(
//                   text: selectedDate != null
//                       ? DateFormat('dd-MM-yyyy').format(selectedDate)
//                       : ''),
//             ),
//             Expanded(
//               child: isLoading
//                   ? FutureBuilder<List<String>>(
//                       future: fetchImages(widget.deviceId, selectedDate),
//                       builder: (context, snapshot) {
//                         if (snapshot.hasError) {
//                           return Text('Error: ${snapshot.error}');
//                         } else if (!snapshot.hasData ||
//                             snapshot.data!.isEmpty) {
//                           return Text('Loading...');
//                         } else {
//                           return ListView.builder(
//                             itemCount: snapshot.data!.length,
//                             itemBuilder: (context, index) {
//                               return Image.network(snapshot.data![index]);
//                             },
//                           );
//                         }
//                       },
//                     )
//                   : ListView.builder(
//                       itemCount: imageUrls.length,
//                       itemBuilder: (context, index) {
//                         return Image.network(imageUrls[index]);
//                       },
//                     ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(primary: Colors.green),
//                   onPressed: currentPage > 0 ? moveToPreviousPage : null,
//                   child: Text('Previous'),
//                 ),
//                 SizedBox(width: 16),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(primary: Colors.green),
//                   onPressed: moveToNextPage,
//                   child: Text('Next'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate ?? DateTime.now(),
//       firstDate: DateTime(1990),
//       lastDate: DateTime.now(),
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: const ColorScheme.light(
//               primary: Colors.green,
//               onPrimary: Colors.white,
//               onSurface: Colors.purple,
//             ),
//             textButtonTheme: TextButtonThemeData(
//               style: TextButton.styleFrom(
//                 elevation: 10,
//                 backgroundColor: Colors.black, // button text color
//               ),
//             ),
//           ),
//           // child: child!,
//           child: MediaQuery(
//             data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
//             child: child ?? Container(),
//           ),
//         );
//       },
//     );

//     if (picked != null && picked != selectedDate) {
//       final newImages = await fetchImages(widget.deviceId, picked);
//       setState(() {
//         selectedDate = picked;
//         imageUrls = newImages;
//       });
//     }
//   }

//   Future<List<String>> fetchImages(String device, DateTime date) async {
//     final formattedDate = DateFormat('dd-MM-yyyy').format(date);
//     final response = await http.get(Uri.parse(
//         'https://tulp6xq61c.execute-api.us-east-1.amazonaws.com/dep/images?device=$device&date=${formattedDate.toString()}'));
//     List<String> currentBatch = [];

//     if (response.statusCode == 200) {
//       final bodyJson = json.decode(response.body);
//       final images = json.decode(bodyJson['body'])['images'];

//       // Extract image URLs
//       for (int i = currentPage * batchSize;
//           i < (currentPage + 1) * batchSize && i < images.length;
//           i++) {
//         currentBatch.add(images[i]);
//       }

//       // Update the list of image URLs
//       imageUrls = currentBatch;
//     } else {
//       throw Exception('Failed to load images');
//     }

//     // Show loading text for a short duration
//     Future.delayed(Duration(milliseconds: 500), () {
//       setState(() {
//         isLoading = false;
//       });
//     });

//     return imageUrls;
//   }

//   void moveToNextPage() {
//     setState(() {
//       currentPage++;
//       isLoading = true;
//     });
//   }

//   void moveToPreviousPage() {
//     setState(() {
//       currentPage--;
//       isLoading = true;
//     });
//   }

//   // Future<void> onDownloadOptionSelected(String option) async {
//   //   if (option == 'Downlaod Current Batch') {
//   //     await downloadCurrentBatch();
//   //   } else if (option == ' Downlaod All Images') {
//   //     await downloadAllImages();
//   //   }
//   // }

//   // Future<void> downloadCurrentBatch() async {
//   //   for (String imageUrl in imageUrls) {
//   //     await _downloadImage(imageUrl);
//   //   }
//   // }

//   // Future<void> downloadAllImages() async {
//   //   final response = await http.get(Uri.parse(apiUrl));
//   //   if (response.statusCode == 200) {
//   //     final bodyJson = json.decode(response.body);
//   //     final images = json.decode(bodyJson['body'])['images'];

//   //     for (String imageUrl in images) {
//   //       await _downloadImage(imageUrl);
//   //     }
//   //   } else {
//   //     throw Exception('Failed to load images');
//   //   }
//   // }

//   // Future<void> _downloadImage(String imageUrl) async {
//   //   WidgetsFlutterBinding.ensureInitialized();

//   //   final response = await http.get(Uri.parse(imageUrl));

//   //   if (response.statusCode == 200) {
//   //     final appDocumentsDirectory = await getApplicationDocumentsDirectory();
//   //     final filePath =
//   //         '${appDocumentsDirectory.path}/${imageUrl.split('/').last}';

//   //     File file = File(filePath);
//   //     await file.writeAsBytes(response.bodyBytes);

//   //     // Display a toast or any other message to indicate the download success
//   //     Fluttertoast.showToast(msg: 'Downloaded: $filePath');
//   //   } else {
//   //     throw Exception('Failed to download image: $imageUrl');
//   //   }
//   // }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;

class Pictures extends StatefulWidget {
  final String deviceId;

  const Pictures({Key? key, required this.deviceId}) : super(key: key);

  @override
  _PicturesState createState() => _PicturesState();
}

class _PicturesState extends State<Pictures> {
  List<String> imageUrls = [];
  DateTime? _startDate; // Track selected start date

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now();
    fetchImages(widget.deviceId, _startDate!); // Fetch images initially
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image Data for ' + widget.deviceId,
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 1.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Start Date',
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                    controller: TextEditingController(
                      text: _startDate != null
                          ? DateFormat('yyyy-MM-dd').format(_startDate!)
                          : '',
                    ),
                    onTap: () => _selectDate(
                        context), // Use _selectDate for date field tap
                  ),
                ),
                SizedBox(
                    width: 16.0), // Add spacing between date field and button
                ElevatedButton(
                  onPressed: () => _downloadAllImages(),
                  style: ElevatedButton.styleFrom(
                    primary: Colors
                        .green, // Set the button's background color to green
                  ),
                  child: Text('Links for Images'),
                ),
              ],
            ),
            SizedBox(height: 16.0), // Add spacing between button and image list
            Text(
              'Total Images: ${imageUrls.length}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0), // Add spacing between text and image list
            Expanded(
              child: ListView.builder(
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  // Calculate the reversed index
                  int reversedIndex = imageUrls.length - 1 - index;
                  return ListTile(
                    title: Image.network(imageUrls[reversedIndex]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
      fetchImages(
          widget.deviceId, _startDate!); // Fetch images on date selection
    }
  }

  Future<void> fetchImages(String device, DateTime date) async {
    final formattedDate = DateFormat('dd-MM-yyyy').format(date);
    try {
      final response = await http.get(Uri.parse(
          'https://tulp6xq61c.execute-api.us-east-1.amazonaws.com/dep/images?device=$device&date=$formattedDate'));

      if (response.statusCode == 200) {
        final bodyJson = json.decode(response.body);
        final images = json.decode(bodyJson['body'])['images'];
        setState(() {
          imageUrls = List<String>.from(images);
        });
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      print('Error fetching images: $e');
      Fluttertoast.showToast(
        msg: 'Error fetching images',
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  void _downloadAllImages() {
    int totalCount = imageUrls.length;
    String concatenatedUrls = imageUrls.join('\n');
    String fileContent = 'Total Images: $totalCount\n$concatenatedUrls';

    List<int> encodedContent = utf8.encode(fileContent);
    String blobUrl = 'data:application/octet-stream;charset=utf-8;base64,' +
        base64Encode(encodedContent);
    html.AnchorElement anchorElement = html.AnchorElement(href: blobUrl)
      ..setAttribute('download', 'images.txt');
    anchorElement.click();
  }
}
