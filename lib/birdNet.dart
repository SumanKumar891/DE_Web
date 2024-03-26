import 'dart:io';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

class birdNet extends StatefulWidget {
  final String deviceId;

  const birdNet({Key? key, required this.deviceId}) : super(key: key);

  @override
  State<birdNet> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<birdNet> {
  late DateTime _startDate;
  late DateTime _endDate;
  String errorMessage = '';
  List<ApiData> tableData = [];

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now();
    _endDate = DateTime.now();
  }

  Future<void> getAPIData(
      String deviceId, DateTime startDate, DateTime endDate) async {
    final response = await http.get(Uri.https(
      'n7xpn7z3k8.execute-api.us-east-1.amazonaws.com',
      '/default/bird_detections',
      {
        'deviceId': deviceId,
        'startDate': DateFormat('dd-MM-yyyy').format(startDate),
        'endDate': DateFormat('dd-MM-yyyy').format(endDate),
      },
    ));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      setState(() {
        tableData = jsonData.map((item) => ApiData.fromJson(item)).toList();
      });
    } else {
      setState(() {
        errorMessage = 'Failed to load data';
      });
    }
  }

  void updateData() async {
    await getAPIData(widget.deviceId, _startDate, _endDate);
  }

  Future<void> downloadMp3(String deviceId, String timestamp) async {
    try {
      final filename = '$deviceId' + "_" + '$timestamp.mp3';
      final url =
          'https://1yyfny7qh1.execute-api.us-east-1.amazonaws.com/download?key=$filename';
      print('Downloading file from: $url');
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final blob = Blob([response.bodyBytes]);
        final anchor = AnchorElement(href: Url.createObjectUrlFromBlob(blob));
        anchor.download = filename;
        anchor.click();
        print('File downloaded successfully');
      } else {
        print('Failed to download file: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error downloading file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BirdNet Data for ' + widget.deviceId,
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
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onTap: () async {
                            final DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: _startDate,
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
                                      primary: Colors.green,
                                      onPrimary: Colors.white,
                                      onSurface: Colors.purple,
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        elevation: 10,
                                        backgroundColor:
                                            Colors.black, // button text color
                                      ),
                                    ),
                                  ),
                                  // child: child!,
                                  child: MediaQuery(
                                    data: MediaQuery.of(context)
                                        .copyWith(alwaysUse24HourFormat: true),
                                    child: child ?? Container(),
                                  ),
                                );
                              },
                            );
                            if (selectedDate != null) {
                              setState(() {
                                _startDate = selectedDate;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Start Date',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                          ),
                          controller: TextEditingController(
                              text:
                                  DateFormat('dd-MM-yyyy').format(_startDate)),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: TextFormField(
                          onTap: () async {
                            final DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: _endDate,
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
                                      primary: Colors.green,
                                      onPrimary: Colors.white,
                                      onSurface: Colors.purple,
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        elevation: 10,
                                        backgroundColor:
                                            Colors.black, // button text color
                                      ),
                                    ),
                                  ),
                                  // child: child!,
                                  child: MediaQuery(
                                    data: MediaQuery.of(context)
                                        .copyWith(alwaysUse24HourFormat: true),
                                    child: child ?? Container(),
                                  ),
                                );
                              },
                            );
                            if (selectedDate != null) {
                              setState(() {
                                _endDate = selectedDate;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'End Date',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                          ),
                          controller: TextEditingController(
                              text: DateFormat('dd-MM-yyyy').format(_endDate)),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          updateData();
                        },
                        child: Text(
                          'Get Data',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          minimumSize: Size(80, 0),
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.0),
                  if (errorMessage.isNotEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          errorMessage,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    )
                  else if (tableData.isNotEmpty)
                    DataTable(
                        decoration: BoxDecoration(
                            // color: Color.fromARGB(255, 111, 196, 114),
                            // borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                        dataRowHeight: 60,
                        columns: [
                          DataColumn(
                              label: Text(
                            'Index',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            'TimeStamp',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            'Common Name',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            'Scientific Name',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text(
                            'Confidence',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataColumn(
                              label: Text('Download Mp3',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ],
                        rows: tableData
                            .asMap()
                            .entries
                            .map(
                              (entry) => DataRow(
                                cells: [
                                  DataCell(
                                    SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            (entry.key + 1).toString(),
                                            style: TextStyle(
                                                color: Colors
                                                    .black), // Set font color to black
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            entry.value.timestamp,
                                            style: TextStyle(
                                                color: Colors
                                                    .black), // Set font color to black
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: entry.value.detections
                                            .map(
                                              (detection) => Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    (entry.value.detections.indexOf(
                                                                    detection) +
                                                                1)
                                                            .toString() +
                                                        ") " +
                                                        detection.commonName,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  if (detection !=
                                                      entry.value.detections
                                                          .last)
                                                    Divider(),
                                                ],
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: entry.value.detections
                                            .map(
                                              (detection) => Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    (entry.value.detections.indexOf(
                                                                    detection) +
                                                                1)
                                                            .toString() +
                                                        ") " +
                                                        detection
                                                            .scientificName,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  if (detection !=
                                                      entry.value.detections
                                                          .last)
                                                    Divider(),
                                                ],
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: entry.value.detections
                                            .map(
                                              (detection) => Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    (entry.value.detections.indexOf(
                                                                    detection) +
                                                                1)
                                                            .toString() +
                                                        ") " +
                                                        detection.confidence
                                                            .toStringAsFixed(3),
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  if (detection !=
                                                      entry.value.detections
                                                          .last)
                                                    Divider(),
                                                ],
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    ElevatedButton(
                                      onPressed: () {
                                        downloadMp3(widget.deviceId,
                                            entry.value.timestamp);
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.teal),
                                      ),
                                      child: Text('Download'),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ApiData {
  final String timestamp;
  final List<Detection> detections;

  ApiData({
    required this.timestamp,
    required this.detections,
  });

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      timestamp: json['TimeStamp'],
      detections: (json['Detections'] as List)
          .map((detectionJson) => Detection.fromJson(detectionJson))
          .toList(),
    );
  }
}

class Detection {
  final String commonName;
  final String scientificName;
  final double confidence;

  Detection({
    required this.commonName,
    required this.scientificName,
    required this.confidence,
  });

  factory Detection.fromJson(Map<String, dynamic> json) {
    return Detection(
      commonName: json['common_name'],
      scientificName: json['scientific_name'],
      confidence:
          double.parse((json['confidence'] as double).toStringAsFixed(3)),
    );
  }
}
