// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bmiplus_project/resultpage.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final bool isMale;
  const DetailPage({super.key, required this.isMale});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late int weight = 7;
  late int height = 104;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.chevron_left,
                              size: 50,
                              color: widget.isMale
                                  ? Color.fromARGB(255, 54, 135, 201)
                                  : Color.fromARGB(255, 178, 38, 176),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'BMI',
                            style: TextStyle(
                              fontSize: 30,
                              color: widget.isMale
                                  ? Color.fromARGB(255, 54, 135, 201)
                                  : Color.fromARGB(255, 178, 38, 176),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Text(widget.isMale ? 'Male' : 'Female',
                          style: TextStyle(
                            fontSize: 27,
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      Icon(
                        widget.isMale
                            ? Icons.male_rounded
                            : Icons.female_rounded,
                        size: 110,
                        color: widget.isMale
                            ? Color.fromARGB(255, 54, 135, 201)
                            : Color.fromARGB(255, 178, 38, 176),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text('Weight (KG)',
                          style: TextStyle(
                            fontSize: 27,
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      Expanded(
                          child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 300,
                        itemBuilder: (context, index) {
                          int i = index + 5;
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  weight = i;
                                });
                              },
                              child: Center(
                                  child: Text(
                                '$i',
                                style: TextStyle(
                                    fontSize: weight == i ? 41 : 29,
                                    color: weight == i
                                        ? widget.isMale
                                            ? Color.fromARGB(255, 54, 135, 201)
                                            : Color.fromARGB(255, 178, 38, 176)
                                        : Colors.black),
                              )),
                            ),
                          );
                        },
                      ))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: widget.isMale
                      ? Color.fromARGB(255, 54, 135, 201)
                      : Color.fromARGB(255, 178, 38, 176),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 48,
                      ),
                      Text(
                        'Height \n (CM)',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Expanded(
                          child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 300,
                        itemBuilder: (context, index) {
                          int i = index + 100;
                          return Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  height = i;
                                });
                              },
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(3.0, 8.0, 3.0, 8.0),
                                decoration: BoxDecoration(
                                    color: height == i ? Colors.white : null,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Center(
                                    child: Text(
                                  '$i',
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: height == i
                                          ? widget.isMale
                                              ? Color.fromARGB(
                                                  255, 54, 135, 201)
                                              : Color.fromARGB(
                                                  255, 178, 38, 176)
                                          : Colors.white),
                                )),
                              ),
                            ),
                          );
                        },
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 8.0,
            left: MediaQuery.sizeOf(context).width * 2 / 3 - 55,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ResultPage(
                        height: height, weight: weight, isMale: widget.isMale),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0), // Adjust the radius as needed
                    ),
                  ),
                  backgroundColor: Color.fromARGB(255, 243, 162, 31),
                ),
                child: Row(
                  children: [
                    Text('CALC', style: TextStyle(fontSize: 17)),
                    Icon(Icons.arrow_forward_ios)
                  ],
                )),
          )
        ],
      ),
    );
  }
}
