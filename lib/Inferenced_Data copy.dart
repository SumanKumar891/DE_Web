// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class Inference extends StatefulWidget {
//   final String deviceId;

//   const Inference({
//     super.key,
//     required this.deviceId,
//   });

//   @override
//   State<Inference> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<Inference> {
//   late TooltipBehavior _tooltipBehavior;
//   late String _startDate;
//   late String _endDate;
//   @override
//   void initState() {
//     _tooltipBehavior = TooltipBehavior(
//       enable: true,
//       color: Colors.white,
//       // textStyle: TextStyle(color: Colors.white),
//       builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
//           int seriesIndex) {
//         final apiData item = chartData[pointIndex];
//         return Container(
//           padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 245, 214, 250),
//             borderRadius: BorderRadius.circular(5),
//             boxShadow: [BoxShadow(color: Colors.purple, blurRadius: 3)],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text("TimeStamp: ${item.TimeStamp}"),
//               Text("Mean: ${item.Mean}"),
//               Text("Class: ${item.Class}"),
//             ],
//           ),
//         );
//       },
//     );

//     super.initState();
//   }

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // _tooltip = TooltipBehavior(enable: true);
//   //   // _startDate = "2022-02-14";
//   //   // // _endDate = "2023-03-28";
//   //   // getapiData(widget.deviceId, _startDate, _endDate);
//   // }

//   void updateData() async {
//     final List<dynamic> jsonString =
//         await getAPIData(widget.deviceId, _startDate, _endDate);

//     chartData.clear();
//     for (dynamic i in jsonString) {
//       chartData.add(apiData.fromJson(i));
//     }

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'TimeSeries Graph For Inferenced Data',
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
//                       child: TextField(
//                         onChanged: (value) {
//                           _startDate = value;
//                         },
//                         decoration: InputDecoration(
//                           labelText: 'Start Date (YYYY-MM-DD)',
//                           border: OutlineInputBorder(),
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 12, horizontal: 16),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 16.0),
//                     Expanded(
//                       child: TextField(
//                         onChanged: (value) {
//                           _endDate = value;
//                         },
//                         decoration: InputDecoration(
//                           labelText: 'End Date (YYYY-MM-DD)',
//                           border: OutlineInputBorder(),
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 12, horizontal: 16),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 16.0),
//                     ElevatedButton(
//                       onPressed: () {
//                         // fetch new data
//                         updateData();
//                       },
//                       child: Text(
//                         'Get Data',
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
//                 Container(
//                   height: 400,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16.0),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.shade300,
//                         blurRadius: 5.0,
//                         spreadRadius: 1.0,
//                         offset: Offset(0.0, 0.0),
//                       ),
//                     ],
//                   ),
//                   child: SfCartesianChart(
//                     legend: Legend(
//                       isVisible: true,
//                       // name:legend,
//                       position: LegendPosition.top,
//                       offset: const Offset(550, -150),
//                       // title: LegendTitle(
//                       //     text: 'Insect',
//                       //     textStyle: TextStyle(
//                       //         color: Colors.black,
//                       //         fontSize: 15,
//                       //         fontStyle: FontStyle.italic,
//                       //         fontWeight: FontWeight.w900)),
//                       // toggleSeriesVisibility: true,
//                       // Border color and border width of legend
//                       overflowMode: LegendItemOverflowMode.wrap,
//                       // borderColor: Colors.black,
//                       // borderWidth: 2
//                     ),
//                     plotAreaBackgroundColor: Colors.white,
//                     primaryXAxis: CategoryAxis(
//                       title: AxisTitle(
//                         text: 'Time',
//                         textStyle: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       labelRotation: 45,
//                     ),
//                     primaryYAxis: NumericAxis(
//                       title: AxisTitle(
//                         text: 'Mean',
//                         textStyle: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       axisLine: AxisLine(width: 0),
//                       majorGridLines: MajorGridLines(width: 0.5),
//                     ),
//                     tooltipBehavior: _tooltipBehavior,
//                     title: ChartTitle(
//                       text: 'Graph Of Mean',
//                       textStyle: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     series: <ChartSeries<apiData, String>>[
//                       LineSeries<apiData, String>(
//                         name: 'Apis Mellifera',
//                         markerSettings: const MarkerSettings(
//                           height: 3.0,
//                           width: 3.0,
//                           borderColor: Colors.green,
//                           isVisible: true,
//                         ),
//                         dataSource: chartData,
//                         xValueMapper: (apiData sales, _) => sales.TimeStamp,
//                         yValueMapper: (apiData sales, _) =>
//                             double.parse(sales.Mean),
//                         dataLabelSettings: DataLabelSettings(isVisible: false),
//                         enableTooltip: true,
//                         animationDuration: 0,
//                         color: Colors.blue,
//                       )
//                     ],
//                     zoomPanBehavior: ZoomPanBehavior(
//                       enablePinching: true,
//                       enablePanning: true,
//                       enableDoubleTapZooming: true,
//                       enableMouseWheelZooming: true,
//                       enableSelectionZooming: true,
//                       selectionRectBorderWidth: 1.0,
//                       selectionRectBorderColor: Colors.blue,
//                       selectionRectColor: Colors.transparent.withOpacity(0.3),
//                       zoomMode: ZoomMode.x,
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

// Future<List<dynamic>> getAPIData(
//     String deviceId, String _startDate, String _endDate) async {
//   final response = await http.get(Uri.https(
//     'd2wa2msynb.execute-api.us-east-1.amazonaws.com',
//     '/inference/inferenced_data',
//     {
//       'startdate': _startDate,
//       'enddate': _endDate,
//       'deviceid': deviceId,
//     },
//   ));
//   var parsed = jsonDecode(response.body); //.cast<Map<String, dynamic>>();
//   if (response.statusCode == 200) {
//     List<dynamic> data = parsed['body'];
//     return data;
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load api');
//   }
// }

// class apiData {
//   apiData(this.TimeStamp, this.Mean, this.Class);

//   final String TimeStamp;
//   final String Mean;
//   final String Class;

//   factory apiData.fromJson(dynamic parsedJson) {
//     return apiData(
//       parsedJson['TimeStamp'].toString(),
//       parsedJson['Mean'].toString(),
//       parsedJson['Class'].toString(),
//     );
//   }
// }

// List<apiData> chartData = [];

// // Future getapiData(String deviceId, _startDate, _endDate) async {
// //   final List<dynamic> jsonString =
// //       await getAPIData(deviceId, _startDate, _endDate);

// //   for (dynamic i in jsonString) {
// //     chartData.add(apiData.fromJson(i));
// //   }

// //   // print(chartData);
// // }

// // // for single and automatically fetching Legend name from dynamoDB

// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class Inference extends StatefulWidget {
//   final String deviceId;

//   const Inference({
//     super.key,
//     required this.deviceId,
//   });

//   @override
//   State<Inference> createState() => _MyHomePageState();
// }

// List<apiData> chartData = [];

// class _MyHomePageState extends State<Inference> {
//   late TooltipBehavior _tooltipBehavior;
//   late String _startDate;
//   late String _endDate;
//   late String Class = " ";

//   List<dynamic> data = [];
//   String errorMessage = '';

//   @override
//   void initState() {
//     _tooltipBehavior = TooltipBehavior(
//       enable: true,
//       color: Colors.white,

//       // textStyle: TextStyle(color: Colors.white),
//       builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
//           int seriesIndex) {
//         final apiData item = chartData[pointIndex];
//         // Class = item.Class;
//         return Container(
//           padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: Color.fromARGB(255, 245, 214, 250),
//             borderRadius: BorderRadius.circular(5),
//             boxShadow: [BoxShadow(color: Colors.purple, blurRadius: 3)],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text("TimeStamp: ${item.TimeStamp}"),
//               Text("Mean: ${item.Mean}"),
//               Text("Class: ${item.Class}"),
//             ],
//           ),
//         );
//       },
//     );

//     super.initState();
//   }

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // _tooltip = TooltipBehavior(enable: true);
//   //   // _startDate = "2022-02-14";
//   //   // // _endDate = "2023-03-28";
//   //   // getapiData(widget.deviceId, _startDate, _endDate);
//   // }

//   Future<void> getAPIData(
//       String deviceId, String _startDate, String _endDate) async {
//     final response = await http.get(Uri.https(
//       'd2wa2msynb.execute-api.us-east-1.amazonaws.com',
//       '/inference/inferenced_data',
//       {
//         'startdate': _startDate,
//         'enddate': _endDate,
//         'deviceid': deviceId,
//       },
//     ));
//     var parsed = jsonDecode(response.body); //.cast<Map<String, dynamic>>();
//     if (parsed['statusCode'] == 200) {
//       data = parsed['body'];
//       chartData.clear();
//       for (dynamic i in data) {
//         chartData.add(apiData.fromJson(i));
//       }
//       setState(() {});
//     } else if (parsed['statusCode'] == 400 ||
//         parsed['statusCode'] == 404 ||
//         parsed['statusCode'] == 500) {
//       setState(() {
//         errorMessage = parsed['body'][0]['message'];
//       });
//     } else {
//       throw Exception('Failed to load api');
//     }
//   }

//   void updateData() async {
//     await getAPIData(widget.deviceId, _startDate, _endDate);
//     if (chartData.isEmpty) {
//       Class = ' ';
//     } else {
//       Class = chartData[0].Class;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'TimeSeries Graph For Insect Count',
//           style: TextStyle(
//             fontSize: 20.0,
//             letterSpacing: 1.0,
//             color: Colors.white,
//           ),
//         ),
//         // Text(widget.deviceId),
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
//                       child: TextField(
//                         onChanged: (value) {
//                           _startDate = value;
//                         },
//                         decoration: InputDecoration(
//                           labelText: 'Start Date (YYYY-MM-DD)',
//                           border: OutlineInputBorder(),
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 12, horizontal: 16),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 16.0),
//                     Expanded(
//                       child: TextField(
//                         onChanged: (value) {
//                           _endDate = value;
//                         },
//                         decoration: InputDecoration(
//                           labelText: 'End Date (YYYY-MM-DD)',
//                           border: OutlineInputBorder(),
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 12, horizontal: 16),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 16.0),
//                     ElevatedButton(
//                       onPressed: () {
//                         // fetch new data
//                         updateData();
//                       },
//                       child: Text(
//                         'Get Data',
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
//                 if (errorMessage.isNotEmpty)
//                   Center(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Container(
//                         height: 400,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Center(
//                           child: Text(
//                             errorMessage,
//                             style: TextStyle(
//                               color: Colors.red,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15,
//                             ),
//                             semanticsLabel: errorMessage = "",
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 else
//                   Container(
//                     height: 400,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16.0),
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.shade300,
//                           blurRadius: 5.0,
//                           spreadRadius: 1.0,
//                           offset: Offset(0.0, 0.0),
//                         ),
//                       ],
//                     ),
//                     child: SfCartesianChart(
//                       legend: Legend(
//                         isVisible: true,
//                         // name:legend,
//                         position: LegendPosition.top,
//                         offset: const Offset(550, -150),
//                         // title: LegendTitle(
//                         //     text: 'Insect',
//                         //     textStyle: TextStyle(
//                         //         color: Colors.black,
//                         //         fontSize: 15,
//                         //         fontStyle: FontStyle.italic,
//                         //         fontWeight: FontWeight.w900)),
//                         // toggleSeriesVisibility: true,
//                         // Border color and border width of legend
//                         overflowMode: LegendItemOverflowMode.wrap,
//                         // borderColor: Colors.black,
//                         // borderWidth: 2
//                       ),
//                       plotAreaBackgroundColor: Colors.white,
//                       primaryXAxis: CategoryAxis(
//                         title: AxisTitle(
//                           text: 'Time',
//                           textStyle: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         labelRotation: 45,
//                       ),
//                       primaryYAxis: NumericAxis(
//                         title: AxisTitle(
//                           text: 'Insect Count',
//                           textStyle: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         axisLine: AxisLine(width: 0),
//                         majorGridLines: MajorGridLines(width: 0.5),
//                       ),
//                       tooltipBehavior: _tooltipBehavior,
//                       title: ChartTitle(
//                         text: 'Graph of Insect Count',
//                         textStyle: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       // title: ChartTitle(
//                       //   text: widget.deviceId,
//                       //   textStyle: TextStyle(fontWeight: FontWeight.bold),
//                       // ),
//                       series: <ChartSeries<apiData, String>>[
//                         LineSeries<apiData, String>(
//                           // Text("Class: ${item.Class}"),
//                           // name: apiData.Class as dynamic,
//                           // name: 'Apis Mellifera',
//                           name: Class,
//                           markerSettings: const MarkerSettings(
//                             height: 3.0,
//                             width: 3.0,
//                             borderColor: Colors.green,
//                             isVisible: true,
//                           ),
//                           dataSource: chartData,
//                           xValueMapper: (apiData sales, _) => sales.TimeStamp,
//                           yValueMapper: (apiData sales, _) =>
//                               double.parse(sales.Mean),
//                           // name: ((apiData sales, _) => sales.TimeStamp) [0],
//                           // name: apiData.Class,
//                           // legendItemText: (apiData sales, _) => sales.Class,
//                           dataLabelSettings: DataLabelSettings(isVisible: true),
//                           enableTooltip: true,
//                           animationDuration: 0,
//                           color: Colors.blue,
//                         )
//                       ],
//                       zoomPanBehavior: ZoomPanBehavior(
//                         enablePinching: true,
//                         enablePanning: true,
//                         enableDoubleTapZooming: true,
//                         enableMouseWheelZooming: true,
//                         enableSelectionZooming: true,
//                         selectionRectBorderWidth: 1.0,
//                         selectionRectBorderColor: Colors.blue,
//                         selectionRectColor: Colors.transparent.withOpacity(0.3),
//                         zoomMode: ZoomMode.x,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Future<List<dynamic>> getAPIData(
//     String deviceId, String _startDate, String _endDate) async {
//   final response = await http.get(Uri.https(
//     'd2wa2msynb.execute-api.us-east-1.amazonaws.com',
//     '/inference/inferenced_data',
//     {
//       'startdate': _startDate,
//       'enddate': _endDate,
//       'deviceid': deviceId,
//     },
//   ));
//   var parsed = jsonDecode(response.body); //.cast<Map<String, dynamic>>();
//   if (response.statusCode == 200) {
//     List<dynamic> data = parsed['body'];
//     return data;
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load api');
//   }
// }

// class apiData {
//   apiData(this.TimeStamp, this.Mean, this.Class);

//   final String TimeStamp;
//   final String Mean;
//   final String Class;

//   factory apiData.fromJson(dynamic parsedJson) {
//     return apiData(
//       parsedJson['TimeStamp'].toString(),
//       parsedJson['Mean'].toString(),
//       parsedJson['Class'].toString(),
//     );
//   }
// }

import 'dart:convert';
import 'dart:html' as html;
import 'package:share/share.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:detest/widget/check_permission.dart';
import 'package:detest/widget/directory_path.dart';

class Inference extends StatefulWidget {
  final String deviceId;

  const Inference({
    super.key,
    required this.deviceId,
  });

  @override
  State<Inference> createState() => _MyHomePageState();
}

// List<apiData> chartData = [];
List<apiData> chartData1 = [];
List<apiData> chartData2 = [];
List<apiData> chartData3 = [];
// List<apiData> chartData3 = [];

class _MyHomePageState extends State<Inference> {
  late TooltipBehavior _tooltipBehavior;
  late DateTime _startDate;
  late DateTime _endDate;
  late String Class = " ";
  late int? count = 0;
  late String csvString = " ";

  var checkAllPermission = CheckPermission();
  var getDirectoryPath = DirectoryPath();
  List<dynamic> data = [];
  String errorMessage = '';

  @override
  void initState() {
    // _tooltipBehavior = TooltipBehavior(
    //   enable: true,
    //   color: Colors.white,

    //   // textStyle: TextStyle(color: Colors.white),
    //   builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
    //       int seriesIndex) {
    //     // final apiData item = chartData[pointIndex];
    //     final apiData item1 = chartData1[pointIndex];
    //     final apiData item2 = chartData2[pointIndex];
    //     // final apiData item3 = chartData3[pointIndex];
    //     // Class = item.Class;
    //     return Container(
    //       padding: EdgeInsets.all(10),
    //       decoration: BoxDecoration(
    //         color: Color.fromARGB(255, 245, 214, 250),
    //         borderRadius: BorderRadius.circular(5),
    //         boxShadow: [BoxShadow(color: Colors.purple, blurRadius: 3)],
    //       ),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Text("TimeStamp: ${item1.TimeStamp}"),
    //           Text("APISME Count: ${item1.Predictions}"),
    //           Text("BOMUTE Count: ${item2.Predictions}"),
    //           // Text("BOMUTE Count: ${item1.Predictions["BOMUTE"] ?? 'N/A'}"),
    //           // Text("APISME Count: ${item2.Predictions["APISME"] ?? 'N/A'}"),
    //           // Text("OSMACO Count: ${item3.Predictions["OSMACO"] ?? 'N/A'}"),

    //           // Text("Class: ${item.Class}"),
    //         ],
    //       ),
    //     );
    //   },
    // );

    super.initState();
    _startDate = DateTime.parse(DateTime.now().toString());
    _endDate = DateTime.parse(DateTime.now().toString());
    // count = 0;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   // _tooltip = TooltipBehavior(enable: true);
  //   // _startDate = "2022-02-14";
  //   // // _endDate = "2023-03-28";
  //   // getapiData(widget.deviceId, _startDate, _endDate);
  // }

  Future<void> getAPIData(
      String deviceId, DateTime _startDate, DateTime _endDate) async {
    final response = deviceId.startsWith('D')
        ? await http.get(Uri.https(
            'd2wa2msynb.execute-api.us-east-1.amazonaws.com',
            '/inference/inferenced_data',
            {
              'startdate': _startDate.year.toString() +
                  "-" +
                  _startDate.month.toString() +
                  "-" +
                  _startDate.day.toString(),
              'enddate': _endDate.year.toString() +
                  "-" +
                  _endDate.month.toString() +
                  "-" +
                  _endDate.day.toString(),
              'deviceid': deviceId,
            },
          ))
        : await http.get(Uri.https(
            'ynm2l0r0di.execute-api.us-east-1.amazonaws.com',
            '/Data/inferenced_data',
            {
              'startdate': _startDate.year.toString() +
                  "-" +
                  _startDate.month.toString() +
                  "-" +
                  _startDate.day.toString(),
              'enddate': _endDate.year.toString() +
                  "-" +
                  _endDate.month.toString() +
                  "-" +
                  _endDate.day.toString(),
              'deviceid': deviceId,
            },
          ));
    // print(response.body);
    final Map<String, dynamic> jsonDataMap =
        Map<String, dynamic>.from(json.decode(response.body));

    final List<Map<String, dynamic>> jsonData = [jsonDataMap];
    List<List<dynamic>> csvData = [
      [
        "TimeStamp",
        "DeviceId",
        "APISME",
        "BOMUTE",
        "OSMACO",
      ]
    ];

    List<dynamic> row = [];
    List<dynamic> test = jsonData[0]["body"];
    int len = test.length;
    // print("Data: ${len}");

    for (int i = 0; i < len; i++) {
      row = [];
      row.add(jsonData[0]["body"][i]['TimeStamp']);
      row.add(jsonData[0]["body"][i]['DeviceId']);
      // row.add(jsonData[0]["body"][i]['Predictions']);
      // row.add(jsonData[0]["body"][i]['Mean']);
      final predictions = json.decode(jsonData[0]["body"][i]['Predictions']);
      if (predictions != null && predictions['APISME'] != null) {
        row.add(predictions['APISME']);
      } else {
        row.add("");
      }
      final predictions1 = json.decode(jsonData[0]["body"][i]['Predictions']);
      if (predictions1 != null && predictions1['BOMUTE'] != null) {
        row.add(predictions1['BOMUTE']);
      } else {
        row.add("");
      }
      final predictions2 = json.decode(jsonData[0]["body"][i]['Predictions']);
      if (predictions2 != null && predictions2['OSMACO'] != null) {
        row.add(predictions2['OSMACO']);
      } else {
        row.add("");
      }

      csvData.add(row);
    }

    csvString = const ListToCsvConverter().convert(csvData);
    // print(csvString);

    // Future<void> _downloadCSV() async {
    //   // Create CSV content
    //   // List<List<dynamic>> rows = [...];
    //   // String csv = const ListToCsvConverter().convert(rows);

    //   // Get external storage directory
    //   Directory? directory = await getExternalStorageDirectory();
    //   DateTime creationTime = DateTime.now();
    //   String ti = creationTime.hour.toString() +
    //       creationTime.minute.toString() +
    //       creationTime.second.toString();
    //   final String path = '/storage/emulated/0/Download/insectcount$ti.csv';
    //   File file = File(path);
    //   // Create file path and write CSV content to file
    //   // File file = File('${directory!.path}/data.csv');
    //   await file.writeAsString(csvString);

    //   // Share or open the file
    //   // Share the file with other apps

    //   Share.shareFiles([file.path], text: 'CSV file');
    //   // Or open the file in the device's default CSV viewer
    //   await OpenFile.open(file.path);
    // }

    // if (await Permission.storage.request().isGranted) {
    //   DateTime creationTime = DateTime.now();
    //   String ti = creationTime.hour.toString() +
    //       creationTime.minute.toString() +
    //       creationTime.second.toString();
    //   final String path = '/storage/emulated/0/Download/insectcount$ti.csv';
    //   File file = File(path);
    //   file.writeAsString(csvString);
    //   // csvPath = path;
    // } else {
    //   // Map<Permission, PermissionStatus> statuses =
    //   await [
    //     Permission.storage,
    //   ].request();
    // }
    // final csvString = csvConverter.convert(csvData);
    var parsed = jsonDecode(response.body); //.cast<Map<String, dynamic>>();
    if (parsed['statusCode'] == 200) {
      data = parsed['body'];

      // Clear all data lists before populating
      // chartData1.clear();
      // chartData2.clear();
      // chartData3.clear();

      // for (dynamic i in data) {
      //   // if (json.decode(i['Predictions']) != {}) {
      //   String bomuteValue = (i['Predictions'])['BOMUTE'];
      //   String apismeValue = (i['Predictions'])['APISME'];
      //   String osmacoValue = (i['Predictions'])['OSMACO'];

      //   int? bomuteParsedValue = int.tryParse(bomuteValue);
      //   int? apismeParsedValue = int.tryParse(apismeValue);
      //   int? osmacoParsedValue = int.tryParse(osmacoValue);

      //   if (bomuteValue != null) {
      //     count = bomuteParsedValue;
      //     // chartData1.add(apiData.fromJson(i, count));
      //     print('bomutevalue:' '$bomuteValue');
      //     print('bomuteParsedValue:' '$bomuteParsedValue');
      //   } else {
      //     print("Error: Could not parse '$bomuteValue' as an integer.");
      //   }

      //   if (apismeValue != null) {
      //     count = apismeParsedValue;
      //     // chartData2.add(apiData.fromJson(i, count));
      //     print('apismeevalue:' '$apismeValue');
      //     print('apismeParsedValue:' '$apismeParsedValue');
      //   } else {
      //     print("Error: Could not parse '$apismeValue' as an integer.");
      //   }

      //   if (osmacoValue != null) {
      //     count = osmacoParsedValue;
      //     // chartData3.add(apiData.fromJson(i, count));
      //     print('osmacovalue:' '$osmacoValue');
      //     print('osmacoParsedValue:' '$osmacoParsedValue');
      //   } else {
      //     print("Error: Could not parse '$osmacoValue' as an integer.");
      //   }
      //   // }
      // }
      data = parsed['body'];
      chartData2.clear();
      chartData1.clear();
      chartData3.clear();

      for (dynamic i in data) {
        print(i['Predictions'] != '{}');
        if (i['Predictions'] != '{}') {
          print(json.decode(i['Predictions'])['APISME']);
          int? apismeParsedValue = (json.decode(i['Predictions'])['APISME']);
          print('apismeParsedValue:' '$apismeParsedValue');
          if (apismeParsedValue != null) {
            count = apismeParsedValue;
            chartData2.add(apiData.fromJson(i, count));
          }
        }
      }
      for (dynamic i in data) {
        print(i['Predictions'] != '{}');
        if (i['Predictions'] != '{}') {
          print(json.decode(i['Predictions'])['BOMUTE']);
          int? bomuteParsedValue = (json.decode(i['Predictions'])['BOMUTE']);
          print('bomuteParsedValue:' '$bomuteParsedValue');
          if (bomuteParsedValue != null) {
            count = bomuteParsedValue;
            chartData1.add(apiData.fromJson(i, count));
          }
        }
      }
      for (dynamic i in data) {
        print(i['Predictions'] != '{}');
        if (i['Predictions'] != '{}') {
          print(json.decode(i['Predictions'])['OSMACO']);
          int? osmacoParsedValue = (json.decode(i['Predictions'])['OSMACO']);
          print('osmacoParsedValue:' '$osmacoParsedValue');
          if (osmacoParsedValue != null) {
            count = osmacoParsedValue;
            chartData3.add(apiData.fromJson(i, count));
          }
        }
      }

      setState(() {});
    } else if (parsed['statusCode'] == 400 ||
        parsed['statusCode'] == 404 ||
        parsed['statusCode'] == 500) {
      setState(() {
        errorMessage = parsed['body'][0]['message'];
      });
    } else {
      throw Exception('Failed to load api');
    }
  }

  Future<void> downloadCsvFile(String csvString, String filename) async {
    // Convert the CSV string to a byte list.
    List<int> csvBytes = utf8.encode(csvString);

    // Create a blob containing the CSV data.
    final blob = html.Blob([csvBytes], 'text/csv');

    // Create a URL for the blob.
    final url = html.Url.createObjectUrlFromBlob(blob);

    // Create a download link and click it to initiate the download.
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..download = filename;
    html.document.body!.append(anchor);
    anchor.click();

    // Clean up by revoking the URL object.
    html.Url.revokeObjectUrl(url);
  }

  void handleDownloadButtonPressed() async {
    // String csvString = 'header1,header2,header3\nvalue1,value2,value3';
    String filename = 'InsectCount.csv';
    await downloadCsvFile(csvString, filename);
    print('Download completed!');
    print('Successful');
  }

  // Future<void> downloadCsv() async {
  //   // if (await Permission.storage.request().isGranted) {
  //   if (await checkAllPermission.isStoragePermission()) {
  //     DateTime creationTime = DateTime.now();
  //     String ti = creationTime.hour.toString() +
  //         creationTime.minute.toString() +
  //         creationTime.second.toString();
  //     final path = getDirectoryPath.getPath();
  //     File file = File(path);
  //     file.writeAsString(csvString);
  //     // csvPath = path;
  //   }
  //   // } else {
  //   //   // Map<Permission, PermissionStatus> statuses =
  //   //   await [
  //   //     Permission.storage,
  //   //   ].request();
  //   // }
  //   // // }
  // }

  // Future<void> _downloadCSV() async {
  //   // Create CSV content
  //   // List<List<dynamic>> rows = [...];
  //   // String csv = const ListToCsvConverter().convert(rows);

  //   // Get external storage directory
  //   // Directory? directory = await getExternalStorageDirectory();
  //   // DateTime creationTime = DateTime.now();
  //   // String ti = creationTime.hour.toString() +
  //   //     creationTime.minute.toString() +
  //   //     creationTime.second.toString();
  //   // final String path = '/storage/emulated/0/Download/insectcount$ti.csv';
  //   // File file = File(path);
  //   // // Create file path and write CSV content to file
  //   // // File file = File('${directory!.path}/data.csv');
  //   // await file.writeAsString(csvString);

  //   // // Share or open the file
  //   // // Share the file with other apps

  //   // Share.shareFiles([file.path], text: 'CSV file');
  //   // // Or open the file in the device's default CSV viewer
  //   // await OpenFile.open(file.path);
  //   // Get path of the Download directory
  //   Directory? downloadDirectory = await getDownloadsDirectory();
  //   String filePath =
  //       '${downloadDirectory!.path}/insectcount_${DateTime.now().millisecondsSinceEpoch}.csv';

  //   // Create the file and write CSV content to file
  //   File file = File(filePath);
  //   await file.writeAsString(csvString);

  //   // Share or open the file
  //   // Share the file with other apps
  //   Share.shareFiles([file.path], text: 'CSV file');

  //   // Or open the file in the device's default CSV viewer
  //   await OpenFile.open(file.path);
  // }

  void updateData() async {
    await getAPIData(widget.deviceId, _startDate, _endDate);
    // if (chartData.isEmpty) {
    //   Class = ' ';
    // } else {
    //   Class = chartData[0].Class;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TimeSeries Graph For Insect Count for ' + widget.deviceId,
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 1.0,
            color: Colors.white,
          ),
        ),
        // Text(widget.deviceId),
        backgroundColor: Colors.green,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                            initialDate: _startDate ?? DateTime.now(),
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
                            text: _startDate != null
                                ? DateFormat('yyyy-MM-dd').format(_startDate)
                                : ''),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        onTap: () async {
                          final DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: _endDate ?? DateTime.now(),
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
                            text: _endDate != null
                                ? DateFormat('yyyy-MM-dd').format(_endDate)
                                : ''),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // fetch new data
                        updateData();
                      },
                      child: Text(
                        'Get Data',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Set the button color to green
                        minimumSize:
                            Size(80, 0), // Set a minimum width for the button
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),

                    // Add other widgets here
                    ElevatedButton(
                      onPressed: handleDownloadButtonPressed,
                      child: Text(
                        'Download CSV',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Set the button color to green
                        minimumSize:
                            Size(80, 0), // Set a minimum width for the button
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     // Add other widgets here
                //     Positioned(
                //       // bottom: 16,
                //       // right: 16,
                //       child: ElevatedButton(
                //         onPressed: handleDownloadButtonPressed,
                //         child: Text(
                //           'Download CSV',
                //           style: TextStyle(
                //             fontSize: 20,
                //           ),
                //         ),
                //         style: ElevatedButton.styleFrom(
                //           primary:
                //               Colors.green, // Set the button color to green
                //           minimumSize:
                //               Size(80, 0), // Set a minimum width for the button
                //           padding: EdgeInsets.symmetric(
                //               vertical: 20, horizontal: 24),
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(8),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 32.0),
                // if (errorMessage.isNotEmpty)
                //   Center(
                //     child: Padding(
                //       padding: const EdgeInsets.all(16.0),
                //       child: Container(
                //         height: 400,
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(10),
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.grey.withOpacity(0.5),
                //               spreadRadius: 2,
                //               blurRadius: 5,
                //               offset: Offset(0, 3),
                //             ),
                //           ],
                //         ),
                //         child: Center(
                //           child: Text(
                //             errorMessage,
                //             style: TextStyle(
                //               color: Colors.red,
                //               fontWeight: FontWeight.bold,
                //               fontSize: 15,
                //             ),
                //             semanticsLabel: errorMessage = "",
                //           ),
                //         ),
                //       ),
                //     ),
                //   )
                // else
                SizedBox(height: 32.0),
                if (errorMessage.isNotEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            errorMessage,
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            semanticsLabel: errorMessage = "",
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                          child: SfCartesianChart(
                            legend: Legend(
                              isVisible: false,
                              // name:legend,
                              position: LegendPosition.top,
                              offset: const Offset(550, -150),
                              // title: LegendTitle(
                              //     text: 'Insect',
                              //     textStyle: TextStyle(
                              //         color: Colors.black,
                              //         fontSize: 15,
                              //         fontStyle: FontStyle.italic,
                              //         fontWeight: FontWeight.w900)),
                              // toggleSeriesVisibility: true,
                              // Border color and border width of legend
                              overflowMode: LegendItemOverflowMode.wrap,
                              // borderColor: Colors.black,
                              // borderWidth: 2
                            ),
                            plotAreaBackgroundColor: Colors.white,
                            primaryXAxis: CategoryAxis(
                              title: AxisTitle(
                                text: 'Time',
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                              ),
                              labelRotation: 45,
                            ),
                            primaryYAxis: NumericAxis(
                              title: AxisTitle(
                                text: 'Insect Count',
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                              ),
                              axisLine: AxisLine(width: 0),
                              majorGridLines: MajorGridLines(width: 0.5),
                              interval: 1,
                            ),
                            // tooltipBehavior: _tooltipBehavior,
                            tooltipBehavior: TooltipBehavior(
                              enable: true,
                              color: Colors.white,
                              // textStyle: TextStyle(color: Colors.white),
                              builder: (dynamic data,
                                  dynamic point,
                                  dynamic series,
                                  int pointIndex,
                                  int seriesIndex) {
                                final apiData item = chartData1[pointIndex];
                                return Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 245, 214, 250),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.purple, blurRadius: 3)
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("TimeStamp: ${item.TimeStamp}"),
                                      Text("BOMUTE Count: ${item.Predictions}"),
                                      // Text("Class: ${item.Class}"),
                                    ],
                                  ),
                                );
                              },
                              // customize the tooltip color
                            ),
                            title: ChartTitle(
                              text: 'GRAPH FOR BOMUTE',
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            // title: ChartTitle(
                            //   text: widget.deviceId,
                            //   textStyle: TextStyle(fontWeight: FontWeight.bold),
                            // ),
                            series: <ChartSeries<apiData, String>>[
                              LineSeries<apiData, String>(
                                // Text("Class: ${item.Class}"),
                                // name: apiData.Class as dynamic,
                                // name: 'Apis Mellifera',
                                name: 'BOMUTE',
                                markerSettings: const MarkerSettings(
                                  height: 3.0,
                                  width: 3.0,
                                  borderColor: Colors.green,
                                  isVisible: true,
                                ),
                                dataSource: chartData1,
                                xValueMapper: (apiData sales, _) =>
                                    sales.TimeStamp,
                                yValueMapper: (apiData sales, _) =>
                                    sales.Predictions,
                                // yValueMapper: (apiData sales, _) {
                                //   final bomuteValue = sales.Predictions["BOMUTE"];
                                //   print("BOMUTE Value: $bomuteValue");
                                //   return bomuteValue != null
                                //       ? int.parse(bomuteValue)
                                //       : 0;
                                // },

                                // name: ((apiData sales, _) => sales.TimeStamp) [0],
                                // name: apiData.Class,
                                // legendItemText: (apiData sales, _) => sales.Class,
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: false),
                                enableTooltip: true,
                                animationDuration: 0,
                                color: Colors.blue,
                              )
                            ],
                            zoomPanBehavior: ZoomPanBehavior(
                              enablePinching: true,
                              enablePanning: true,
                              enableDoubleTapZooming: true,
                              enableMouseWheelZooming: true,
                              enableSelectionZooming: true,
                              selectionRectBorderWidth: 1.0,
                              selectionRectBorderColor: Colors.blue,
                              selectionRectColor:
                                  Colors.transparent.withOpacity(0.3),
                              zoomMode: ZoomMode.x,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        //APISMEEEEEEEEEEEEEEEEEEEEEEEEE
                        Container(
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                          child: SfCartesianChart(
                            legend: Legend(
                              isVisible: false,
                              // name:legend,
                              position: LegendPosition.top,
                              offset: const Offset(550, -150),
                              // title: LegendTitle(
                              //     text: 'Insect',
                              //     textStyle: TextStyle(
                              //         color: Colors.black,
                              //         fontSize: 15,
                              //         fontStyle: FontStyle.italic,
                              //         fontWeight: FontWeight.w900)),
                              // toggleSeriesVisibility: true,
                              // Border color and border width of legend
                              overflowMode: LegendItemOverflowMode.wrap,
                              // borderColor: Colors.black,
                              // borderWidth: 2
                            ),
                            plotAreaBackgroundColor: Colors.white,
                            primaryXAxis: CategoryAxis(
                              title: AxisTitle(
                                text: 'Time',
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                              ),
                              labelRotation: 45,
                            ),
                            primaryYAxis: NumericAxis(
                              title: AxisTitle(
                                text: 'Insect Count',
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                              ),
                              axisLine: AxisLine(width: 0),
                              majorGridLines: MajorGridLines(width: 0.5),
                              interval: 1,
                            ),
                            // tooltipBehavior: _tooltipBehavior,
                            tooltipBehavior: TooltipBehavior(
                              enable: true,
                              color: Colors.white,
                              // textStyle: TextStyle(color: Colors.white),
                              builder: (dynamic data,
                                  dynamic point,
                                  dynamic series,
                                  int pointIndex,
                                  int seriesIndex) {
                                final apiData item = chartData2[pointIndex];
                                return Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 245, 214, 250),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.purple, blurRadius: 3)
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("TimeStamp: ${item.TimeStamp}"),
                                      Text("APISME Count: ${item.Predictions}"),
                                      // Text("Class: ${item.Class}"),
                                    ],
                                  ),
                                );
                              },
                              // customize the tooltip color
                            ),
                            title: ChartTitle(
                              text: 'GRAPH FOR APISME',
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            // title: ChartTitle(
                            //   text: widget.deviceId,
                            //   textStyle: TextStyle(fontWeight: FontWeight.bold),
                            // ),
                            series: <ChartSeries<apiData, String>>[
                              LineSeries<apiData, String>(
                                // Text("Class: ${item.Class}"),
                                // name: apiData.Class as dynamic,
                                // name: 'Apis Mellifera',
                                name: 'APISME',
                                markerSettings: const MarkerSettings(
                                  height: 3.0,
                                  width: 3.0,
                                  borderColor: Colors.green,
                                  isVisible: true,
                                ),
                                dataSource: chartData2,
                                xValueMapper: (apiData sales, _) =>
                                    sales.TimeStamp,
                                yValueMapper: (apiData sales, _) =>
                                    sales.Predictions,
                                // yValueMapper: (apiData sales, _) {
                                //   final apismeValue = sales.Predictions["APISME"];
                                //   print("APISME Value: $apismeValue");
                                //   return apismeValue != null
                                //       ? int.parse(apismeValue)
                                //       : 0;
                                // },

                                // double.parse(sales.Predictions['OSMACO'].toString()),
                                // name: ((apiData sales, _) => sales.TimeStamp) [0],
                                // name: apiData.Class,
                                // legendItemText: (apiData sales, _) => sales.Class,
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: false),
                                enableTooltip: true,
                                animationDuration: 0,
                                color: Colors.blue,
                              )
                            ],
                            zoomPanBehavior: ZoomPanBehavior(
                              enablePinching: true,
                              enablePanning: true,
                              enableDoubleTapZooming: true,
                              enableMouseWheelZooming: true,
                              enableSelectionZooming: true,
                              selectionRectBorderWidth: 1.0,
                              selectionRectBorderColor: Colors.blue,
                              selectionRectColor:
                                  Colors.transparent.withOpacity(0.3),
                              zoomMode: ZoomMode.x,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                          child: SfCartesianChart(
                            legend: Legend(
                              isVisible: false,
                              // name:legend,
                              position: LegendPosition.top,
                              offset: const Offset(550, -150),
                              // title: LegendTitle(
                              //     text: 'Insect',
                              //     textStyle: TextStyle(
                              //         color: Colors.black,
                              //         fontSize: 15,
                              //         fontStyle: FontStyle.italic,
                              //         fontWeight: FontWeight.w900)),
                              // toggleSeriesVisibility: true,
                              // Border color and border width of legend
                              overflowMode: LegendItemOverflowMode.wrap,
                              // borderColor: Colors.black,
                              // borderWidth: 2
                            ),
                            plotAreaBackgroundColor: Colors.white,
                            primaryXAxis: CategoryAxis(
                              title: AxisTitle(
                                text: 'Time',
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                              ),
                              labelRotation: 45,
                            ),
                            primaryYAxis: NumericAxis(
                              title: AxisTitle(
                                text: 'Insect Count',
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                              ),
                              axisLine: AxisLine(width: 0),
                              majorGridLines: MajorGridLines(width: 0.5),
                              interval: 1,
                            ),
                            // tooltipBehavior: _tooltipBehavior,
                            tooltipBehavior: TooltipBehavior(
                              enable: true,
                              color: Colors.white,
                              // textStyle: TextStyle(color: Colors.white),
                              builder: (dynamic data,
                                  dynamic point,
                                  dynamic series,
                                  int pointIndex,
                                  int seriesIndex) {
                                final apiData item = chartData3[pointIndex];
                                return Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 245, 214, 250),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.purple, blurRadius: 3)
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("TimeStamp: ${item.TimeStamp}"),
                                      Text("OSMACO Count: ${item.Predictions}"),
                                      // Text("Class: ${item.Class}"),
                                    ],
                                  ),
                                );
                              },
                              // customize the tooltip color
                            ),
                            title: ChartTitle(
                              text: 'GRAPH FOR OSMACO',
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            // title: ChartTitle(
                            //   text: widget.deviceId,
                            //   textStyle: TextStyle(fontWeight: FontWeight.bold),
                            // ),
                            series: <ChartSeries<apiData, String>>[
                              LineSeries<apiData, String>(
                                // Text("Class: ${item.Class}"),
                                // name: apiData.Class as dynamic,
                                // name: 'Apis Mellifera',
                                name: 'OSMACO',
                                markerSettings: const MarkerSettings(
                                  height: 3.0,
                                  width: 3.0,
                                  borderColor: Colors.green,
                                  isVisible: true,
                                ),
                                dataSource: chartData3,
                                xValueMapper: (apiData sales, _) =>
                                    sales.TimeStamp,
                                yValueMapper: (apiData sales, _) =>
                                    sales.Predictions,
                                // yValueMapper: (apiData sales, _) {
                                //   final apismeValue = sales.Predictions["APISME"];
                                //   print("APISME Value: $apismeValue");
                                //   return apismeValue != null
                                //       ? int.parse(apismeValue)
                                //       : 0;
                                // },

                                // double.parse(sales.Predictions['OSMACO'].toString()),
                                // name: ((apiData sales, _) => sales.TimeStamp) [0],
                                // name: apiData.Class,
                                // legendItemText: (apiData sales, _) => sales.Class,
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: false),
                                enableTooltip: true,
                                animationDuration: 0,
                                color: Colors.blue,
                              )
                            ],
                            zoomPanBehavior: ZoomPanBehavior(
                              enablePinching: true,
                              enablePanning: true,
                              enableDoubleTapZooming: true,
                              enableMouseWheelZooming: true,
                              enableSelectionZooming: true,
                              selectionRectBorderWidth: 1.0,
                              selectionRectBorderColor: Colors.blue,
                              selectionRectColor:
                                  Colors.transparent.withOpacity(0.3),
                              zoomMode: ZoomMode.x,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
              //BOMUTEEEEEEEEEEEEEEEEEEEEEEE
              // Container(
              //   height: 400,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(16.0),
              //     color: Colors.white,
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.shade300,
              //         blurRadius: 5.0,
              //         spreadRadius: 1.0,
              //         offset: Offset(0.0, 0.0),
              //       ),
              //     ],
              //   ),
              //   child: SfCartesianChart(
              //     legend: Legend(
              //       isVisible: false,
              //       // name:legend,
              //       position: LegendPosition.top,
              //       offset: const Offset(550, -150),
              //       // title: LegendTitle(
              //       //     text: 'Insect',
              //       //     textStyle: TextStyle(
              //       //         color: Colors.black,
              //       //         fontSize: 15,
              //       //         fontStyle: FontStyle.italic,
              //       //         fontWeight: FontWeight.w900)),
              //       // toggleSeriesVisibility: true,
              //       // Border color and border width of legend
              //       overflowMode: LegendItemOverflowMode.wrap,
              //       // borderColor: Colors.black,
              //       // borderWidth: 2
              //     ),
              //     plotAreaBackgroundColor: Colors.white,
              //     primaryXAxis: CategoryAxis(
              //       title: AxisTitle(
              //         text: 'Time',
              //         textStyle: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //       labelRotation: 45,
              //     ),
              //     primaryYAxis: NumericAxis(
              //       title: AxisTitle(
              //         text: 'Insect Count',
              //         textStyle: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //       axisLine: AxisLine(width: 0),
              //       majorGridLines: MajorGridLines(width: 0.5),
              //     ),
              //     // tooltipBehavior: _tooltipBehavior,
              //     tooltipBehavior: TooltipBehavior(
              //       enable: true,
              //       color: Colors.white,
              //       // textStyle: TextStyle(color: Colors.white),
              //       builder: (dynamic data, dynamic point, dynamic series,
              //           int pointIndex, int seriesIndex) {
              //         final apiData item = chartData1[pointIndex];
              //         return Container(
              //           padding: EdgeInsets.all(10),
              //           decoration: BoxDecoration(
              //             color: Color.fromARGB(255, 245, 214, 250),
              //             borderRadius: BorderRadius.circular(5),
              //             boxShadow: [
              //               BoxShadow(color: Colors.purple, blurRadius: 3)
              //             ],
              //           ),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisSize: MainAxisSize.min,
              //             children: [
              //               Text("TimeStamp: ${item.TimeStamp}"),
              //               Text("BOMUTE Count: ${item.Predictions}"),
              //               // Text("Class: ${item.Class}"),
              //             ],
              //           ),
              //         );
              //       },
              //       // customize the tooltip color
              //     ),
              //     title: ChartTitle(
              //       text: 'GRAPH FOR BOMUTE',
              //       textStyle: TextStyle(fontWeight: FontWeight.bold),
              //     ),
              //     // title: ChartTitle(
              //     //   text: widget.deviceId,
              //     //   textStyle: TextStyle(fontWeight: FontWeight.bold),
              //     // ),
              //     series: <ChartSeries<apiData, String>>[
              //       LineSeries<apiData, String>(
              //         // Text("Class: ${item.Class}"),
              //         // name: apiData.Class as dynamic,
              //         // name: 'Apis Mellifera',
              //         name: 'BOMUTE',
              //         markerSettings: const MarkerSettings(
              //           height: 3.0,
              //           width: 3.0,
              //           borderColor: Colors.green,
              //           isVisible: true,
              //         ),
              //         dataSource: chartData1,
              //         xValueMapper: (apiData sales, _) => sales.TimeStamp,
              //         yValueMapper: (apiData sales, _) => sales.Predictions,
              //         // yValueMapper: (apiData sales, _) {
              //         //   final bomuteValue = sales.Predictions["BOMUTE"];
              //         //   print("BOMUTE Value: $bomuteValue");
              //         //   return bomuteValue != null
              //         //       ? int.parse(bomuteValue)
              //         //       : 0;
              //         // },

              //         // name: ((apiData sales, _) => sales.TimeStamp) [0],
              //         // name: apiData.Class,
              //         // legendItemText: (apiData sales, _) => sales.Class,
              //         dataLabelSettings:
              //             DataLabelSettings(isVisible: false),
              //         enableTooltip: true,
              //         animationDuration: 0,
              //         color: Colors.blue,
              //       )
              //     ],
              //     zoomPanBehavior: ZoomPanBehavior(
              //       enablePinching: true,
              //       enablePanning: true,
              //       enableDoubleTapZooming: true,
              //       enableMouseWheelZooming: true,
              //       enableSelectionZooming: true,
              //       selectionRectBorderWidth: 1.0,
              //       selectionRectBorderColor: Colors.blue,
              //       selectionRectColor: Colors.transparent.withOpacity(0.3),
              //       zoomMode: ZoomMode.x,
              //     ),
              //   ),
              // ),
              // OSMACOOOOOOOOOOOOOOOOO
              // Container(
              //   height: 400,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(16.0),
              //     color: Colors.white,
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.shade300,
              //         blurRadius: 5.0,
              //         spreadRadius: 1.0,
              //         offset: Offset(0.0, 0.0),
              //       ),
              //     ],
              //   ),
              //   child: SfCartesianChart(
              //     legend: Legend(
              //       isVisible: false,
              //       // name:legend,
              //       position: LegendPosition.top,
              //       offset: const Offset(550, -150),
              //       // title: LegendTitle(
              //       //     text: 'Insect',
              //       //     textStyle: TextStyle(
              //       //         color: Colors.black,
              //       //         fontSize: 15,
              //       //         fontStyle: FontStyle.italic,
              //       //         fontWeight: FontWeight.w900)),
              //       // toggleSeriesVisibility: true,
              //       // Border color and border width of legend
              //       overflowMode: LegendItemOverflowMode.wrap,
              //       // borderColor: Colors.black,
              //       // borderWidth: 2
              //     ),
              //     plotAreaBackgroundColor: Colors.white,
              //     primaryXAxis: CategoryAxis(
              //       title: AxisTitle(
              //         text: 'Time',
              //         textStyle: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //       labelRotation: 45,
              //     ),
              //     primaryYAxis: NumericAxis(
              //       title: AxisTitle(
              //         text: 'Insect Count',
              //         textStyle: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //       axisLine: AxisLine(width: 0),
              //       majorGridLines: MajorGridLines(width: 0.5),
              //     ),
              //     tooltipBehavior: _tooltipBehavior,
              //     title: ChartTitle(
              //       text: 'GRAPH FOR OSMACO',
              //       textStyle: TextStyle(fontWeight: FontWeight.bold),
              //     ),
              //     // title: ChartTitle(
              //     //   text: widget.deviceId,
              //     //   textStyle: TextStyle(fontWeight: FontWeight.bold),
              //     // ),
              //     series: <ChartSeries<apiData, String>>[
              //       LineSeries<apiData, String>(
              //         // Text("Class: ${item.Class}"),
              //         // name: apiData.Class as dynamic,
              //         // name: 'Apis Mellifera',
              //         name: 'OSMACO',
              //         markerSettings: const MarkerSettings(
              //           height: 3.0,
              //           width: 3.0,
              //           borderColor: Colors.green,
              //           isVisible: true,
              //         ),
              //         dataSource: chartData,
              //         xValueMapper: (apiData sales, _) => sales.TimeStamp,
              //         yValueMapper: (apiData sales, _) =>
              //             int.parse(sales.Predictions),
              //         // yValueMapper: (apiData sales, _) {
              //         //   final osmacoValue = sales.Predictions["OSMACO"];
              //         //   print("OSMACO Value: $osmacoValue");
              //         //   return osmacoValue != null
              //         //       ? int.parse(osmacoValue)
              //         //       : 0;
              //         // },

              //         // double.parse(sales.Predictions['OSMACO'].toString()),
              //         // name: ((apiData sales, _) => sales.TimeStamp) [0],
              //         // name: apiData.Class,
              //         // legendItemText: (apiData sales, _) => sales.Class,
              //         dataLabelSettings: DataLabelSettings(isVisible: false),
              //         enableTooltip: true,
              //         animationDuration: 0,
              //         color: Colors.blue,
              //       )
              //     ],
              //     zoomPanBehavior: ZoomPanBehavior(
              //       enablePinching: true,
              //       enablePanning: true,
              //       enableDoubleTapZooming: true,
              //       enableMouseWheelZooming: true,
              //       enableSelectionZooming: true,
              //       selectionRectBorderWidth: 1.0,
              //       selectionRectBorderColor: Colors.blue,
              //       selectionRectColor: Colors.transparent.withOpacity(0.3),
              //       zoomMode: ZoomMode.x,
              //     ),
              //   ),
              // ),
              // //APISMEEEEEEEEEEEEEEEEEEEEEEEEE
              // Container(
              //   height: 400,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(16.0),
              //     color: Colors.white,
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.shade300,
              //         blurRadius: 5.0,
              //         spreadRadius: 1.0,
              //         offset: Offset(0.0, 0.0),
              //       ),
              //     ],
              //   ),
              //   child: SfCartesianChart(
              //     legend: Legend(
              //       isVisible: false,
              //       // name:legend,
              //       position: LegendPosition.top,
              //       offset: const Offset(550, -150),
              //       // title: LegendTitle(
              //       //     text: 'Insect',
              //       //     textStyle: TextStyle(
              //       //         color: Colors.black,
              //       //         fontSize: 15,
              //       //         fontStyle: FontStyle.italic,
              //       //         fontWeight: FontWeight.w900)),
              //       // toggleSeriesVisibility: true,
              //       // Border color and border width of legend
              //       overflowMode: LegendItemOverflowMode.wrap,
              //       // borderColor: Colors.black,
              //       // borderWidth: 2
              //     ),
              //     plotAreaBackgroundColor: Colors.white,
              //     primaryXAxis: CategoryAxis(
              //       title: AxisTitle(
              //         text: 'Time',
              //         textStyle: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //       labelRotation: 45,
              //     ),
              //     primaryYAxis: NumericAxis(
              //       title: AxisTitle(
              //         text: 'Insect Count',
              //         textStyle: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //       axisLine: AxisLine(width: 0),
              //       majorGridLines: MajorGridLines(width: 0.5),
              //     ),
              //     // tooltipBehavior: _tooltipBehavior,
              //     tooltipBehavior: TooltipBehavior(
              //       enable: true,
              //       color: Colors.white,
              //       // textStyle: TextStyle(color: Colors.white),
              //       builder: (dynamic data, dynamic point, dynamic series,
              //           int pointIndex, int seriesIndex) {
              //         final apiData item = chartData2[pointIndex];
              //         return Container(
              //           padding: EdgeInsets.all(10),
              //           decoration: BoxDecoration(
              //             color: Color.fromARGB(255, 245, 214, 250),
              //             borderRadius: BorderRadius.circular(5),
              //             boxShadow: [
              //               BoxShadow(color: Colors.purple, blurRadius: 3)
              //             ],
              //           ),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisSize: MainAxisSize.min,
              //             children: [
              //               Text("TimeStamp: ${item.TimeStamp}"),
              //               Text("APISME Count: ${item.Predictions}"),
              //               // Text("Class: ${item.Class}"),
              //             ],
              //           ),
              //         );
              //       },
              //       // customize the tooltip color
              //     ),
              //     title: ChartTitle(
              //       text: 'GRAPH FOR APISME',
              //       textStyle: TextStyle(fontWeight: FontWeight.bold),
              //     ),
              //     // title: ChartTitle(
              //     //   text: widget.deviceId,
              //     //   textStyle: TextStyle(fontWeight: FontWeight.bold),
              //     // ),
              //     series: <ChartSeries<apiData, String>>[
              //       LineSeries<apiData, String>(
              //         // Text("Class: ${item.Class}"),
              //         // name: apiData.Class as dynamic,
              //         // name: 'Apis Mellifera',
              //         name: 'APISME',
              //         markerSettings: const MarkerSettings(
              //           height: 3.0,
              //           width: 3.0,
              //           borderColor: Colors.green,
              //           isVisible: true,
              //         ),
              //         dataSource: chartData2,
              //         xValueMapper: (apiData sales, _) => sales.TimeStamp,
              //         yValueMapper: (apiData sales, _) => sales.Predictions,
              //         // yValueMapper: (apiData sales, _) {
              //         //   final apismeValue = sales.Predictions["APISME"];
              //         //   print("APISME Value: $apismeValue");
              //         //   return apismeValue != null
              //         //       ? int.parse(apismeValue)
              //         //       : 0;
              //         // },

              //         // double.parse(sales.Predictions['OSMACO'].toString()),
              //         // name: ((apiData sales, _) => sales.TimeStamp) [0],
              //         // name: apiData.Class,
              //         // legendItemText: (apiData sales, _) => sales.Class,
              //         dataLabelSettings: DataLabelSettings(isVisible: false),
              //         enableTooltip: true,
              //         animationDuration: 0,
              //         color: Colors.blue,
              //       )
              //     ],
              //     zoomPanBehavior: ZoomPanBehavior(
              //       enablePinching: true,
              //       enablePanning: true,
              //       enableDoubleTapZooming: true,
              //       enableMouseWheelZooming: true,
              //       enableSelectionZooming: true,
              //       selectionRectBorderWidth: 1.0,
              //       selectionRectBorderColor: Colors.blue,
              //       selectionRectColor: Colors.transparent.withOpacity(0.3),
              //       zoomMode: ZoomMode.x,
              //     ),
              //   ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<List<dynamic>> getAPIData(
    String deviceId, DateTime _startDate, DateTime _endDate) async {
  final response = await http.get(Uri.https(
    'd2wa2msynb.execute-api.us-east-1.amazonaws.com',
    '/inference/inferenced_data',
    {
      'startdate': _startDate.year.toString() +
          "-" +
          _startDate.month.toString() +
          "-" +
          _startDate.day.toString(),
      'enddate': _endDate.year.toString() +
          "-" +
          _endDate.month.toString() +
          "-" +
          _endDate.day.toString(),
      'deviceid': deviceId,
    },
  ));
  var parsed = jsonDecode(response.body); //.cast<Map<String, dynamic>>();
  if (response.statusCode == 200) {
    List<dynamic> data = parsed['body'];
    return data;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load api');
  }
}

class apiData {
  apiData(this.TimeStamp, this.Predictions);

  final String TimeStamp;
  final int Predictions;
  // final String Class;

  factory apiData.fromJson(dynamic parsedJson, count) {
    // final Map<String, dynamic> jsonDataMap =
    //     Map<String, dynamic>.from(json.decode(Predictions));

    // final List<Map<String, dynamic>> jsonData = [jsonDataMap];
    return apiData(
      parsedJson['TimeStamp'].toString(),
      // json.decode(parsedJson['Predictions'])
      // parsedJson['Predictions'],
      count,
    );
  }
}
// class apiData {
//   apiData(this.TimeStamp, this.Predictions);

//   final String TimeStamp;
//   final Map<String, String> Predictions; // Assuming values are strings

//   factory apiData.fromJson(dynamic parsedJson) {
//     return apiData(
//       parsedJson['TimeStamp'].toString(),
//       Map<String, String>.from(json.decode(parsedJson['Predictions'])),
//     );
//   }
// }
