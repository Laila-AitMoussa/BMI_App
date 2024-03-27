// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bmiplus_project/detailpage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GenderCard(
            gendar: 'Male',
            isMale: true,
            genderColor: Color.fromARGB(255, 54, 135, 201),
            genderIcon: Icons.male_rounded,
          ),
          GenderCard(
            gendar: 'Female',
            isMale: false,
            genderColor: Color.fromARGB(255, 178, 38, 176),
            genderIcon: Icons.female_rounded,
          ),
        ],
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  bool isMale;
  String gendar;
  Color genderColor;
  IconData genderIcon;
  GenderCard(
      {super.key,
      required this.gendar,
      required this.isMale,
      required this.genderColor,
      required this.genderIcon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(isMale: isMale),
          ));
        },
        //color: Color.fromARGB(255, 54, 135, 201),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.zero, // Set the border radius to zero
              ),
            ),
            backgroundColor: MaterialStatePropertyAll(genderColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              genderIcon,
              size: 70.0,
              color: Colors.white,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              gendar,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
