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

  Future<void> _refreshData() async {
    // Fetch updated images based on the current start date
    await fetchImages(widget.deviceId, _startDate!);
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
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Select Date',
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                    controller: TextEditingController(
                      text: _startDate != null
                          ? DateFormat('yyyy-MM-dd').format(_startDate!)
                          : '',
                    ),
                    onTap: () => _selectDate(context),
                  ),
                ),
                SizedBox(
                    width: 16.0), // Add spacing between date field and buttons
                ElevatedButton(
                  onPressed: () => _downloadAllImages(),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown[600],
                    // Set button's background color to green
                  ),
                  child: Text('Links for Images'),
                ),
                SizedBox(width: 16.0), // Add spacing between buttons
                ElevatedButton.icon(
                  onPressed: _refreshData,
                  style: ElevatedButton.styleFrom(
                    primary: Colors
                        .brown[600], // Set button's background color to blue
                  ),
                  icon: Icon(Icons.refresh), // Add refresh icon
                  label: Text('Refresh'),
                ),
              ],
            ),
            SizedBox(height: 16.0), // Add spacing before text and image list
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
      await fetchImages(
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
    // Generate text file content with total count and image URLs
    int totalCount = imageUrls.length;
    String concatenatedUrls = imageUrls.join('\n');
    String fileContent = 'Total Images: $totalCount\n$concatenatedUrls';

    // Encode content as UTF-8
    List<int> encodedContent = utf8.encode(fileContent);

    // Create blob URL for download
    String blobUrl = 'data:application/octet-stream;charset=utf-8;base64,' +
        base64Encode(encodedContent);

    // Create anchor element for download
    html.AnchorElement anchorElement = html.AnchorElement(href: blobUrl)
      ..setAttribute('download', 'images.txt');

    // Trigger download
    anchorElement.click();
  }
}
