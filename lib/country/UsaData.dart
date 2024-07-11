import 'dart:convert';
import 'package:detest/Battery.dart';
import 'package:detest/Image_download.dart';
import 'package:detest/Inferenced_Data copy.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:detest/constant.dart';
import 'package:detest/weatherData.dart';

import 'package:intl/intl.dart';

class USA_Screen extends StatefulWidget {
  @override
  State<USA_Screen> createState() => _USA_ScreenState();
}

class _USA_ScreenState extends State<USA_Screen> {
  late TextEditingController dateController;
  late TextEditingController timeinput;

  late int sleepDuration = 0;
  List<Device> filterData = deviceData
      .where((device) =>
          device.deviceId == "02" ||
          device.deviceId == "05" ||
          device.deviceId == "04" ||
          device.deviceId == "06")
      .toList();

  @override
  void initState() {
    dateController = TextEditingController();
    timeinput = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: buttonColor,
          title: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text('USA Driscoll\'s Deployment DATA')
            ],
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Table(
                    columnWidths: const {
                      0: FractionColumnWidth(0.07),
                      1: FractionColumnWidth(0.15),
                      2: FractionColumnWidth(0.15),
                      3: FractionColumnWidth(0.15),
                      4: FractionColumnWidth(0.15),
                      5: FractionColumnWidth(0.15),
                      6: FractionColumnWidth(0.18)
                    },
                    children: const <TableRow>[
                      TableRow(children: <Widget>[
                        Center(
                          child: Text(
                            'S.NO',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: backgroundColor),
                          ),
                        ),
                        Center(
                          child: Text(
                            'DEVICE ID',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: backgroundColor),
                          ),
                        ),
                        Center(
                          child: Text(
                            'BOOT STATUS',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: backgroundColor),
                          ),
                        ),

                        Center(
                          child: Text(
                            'Weather Data',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: backgroundColor),
                          ),
                        ),
                        // Center(
                        //   child: Text(
                        //     'Motion Count',
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
                            'Image',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: backgroundColor),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Battery',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: backgroundColor),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
            for (int i = 0; i < filterData.length; i++)
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                    child: Table(
                      columnWidths: const {
                        0: FractionColumnWidth(0.07),
                        1: FractionColumnWidth(0.15),
                        2: FractionColumnWidth(0.15),
                        3: FractionColumnWidth(0.15),
                        4: FractionColumnWidth(0.15),
                        5: FractionColumnWidth(0.15),
                        6: FractionColumnWidth(0.18)
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
                                filterData[i].deviceId,
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
                                    'Last Active: ${filterData[i].lastActive}',
                                child: Text(
                                  filterData[i].status,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  // print('Status');
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => Weather(
                                        // values: [],
                                        deviceId: filterData[i].deviceId,
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.cloud,
                                  color: backgroundColor,
                                ),
                                // label: const Text('TempDB Data'),
                                style: ElevatedButton.styleFrom(
                                    // elevation: 10,
                                    backgroundColor: Colors.white10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  // print('Inference');
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => Inference(
                                        // values: [],
                                        deviceId: filterData[i].deviceId,
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.insert_chart,
                                  color: backgroundColor,
                                ),
                                // label: const Text('Inferenced Data'),
                                style: ElevatedButton.styleFrom(
                                    // elevation: 10,
                                    backgroundColor: Colors.white10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  // print('Status');
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => Pictures(
                                        deviceId: filterData[i].deviceId,
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.image,
                                  color: backgroundColor,
                                ),
                                // label: const Text('TempDB Data'),
                                style: ElevatedButton.styleFrom(
                                    // elevation: 10,
                                    backgroundColor: Colors.white10),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 40,
                          //   child:
                          //       // Center(
                          //       //   child: FutureBuilder<String>(
                          //       //     future: fetchBatteryPercentage(
                          //       //         deviceData[i].deviceId),
                          //       //     builder: (context, snapshot) {
                          //       //       if (snapshot.connectionState ==
                          //       //           ConnectionState.waiting) {
                          //       //         return CircularProgressIndicator(
                          //       //           color: Colors.green,
                          //       //         );
                          //       //       } else if (snapshot.hasError) {
                          //       //         return Text(
                          //       //             'Error fetching battery percentage');
                          //       //       } else {
                          //       //         return Row(
                          //       //           mainAxisAlignment:
                          //       //               MainAxisAlignment.center,
                          //       //           children: [
                          //       IconButton(
                          //     onPressed: () {
                          //       Navigator.of(context).push(
                          //         MaterialPageRoute(
                          //           builder: (_) => Battery(
                          //               deviceId: filterData[i].deviceId,
                          //           ),
                          //         ),
                          //       );
                          //     },
                          //     icon: const Icon(
                          //       Icons.battery_6_bar,
                          //       color: backgroundColor,
                          //     ),
                          //   ),
                          //   //             Text(
                          //   //               snapshot.data ?? 'N/A',
                          //   //               style: TextStyle(
                          //   //                   color: Colors.white),
                          //   //             ),
                          //   //           ],
                          //   //         );
                          //   //       }
                          //   //     },
                          //   //   ),
                          //   // ),
                          // ),
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ));
  }
}
