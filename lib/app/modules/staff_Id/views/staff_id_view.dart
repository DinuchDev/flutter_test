import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_network/image_network.dart';

import '../controllers/staff_id_controller.dart';

class StaffIdView extends GetView<StaffIdController> {
  const StaffIdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        color: Colors.orange.shade900,
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageNetwork(
                        image:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDM2SDL8XuD21iaYLeaqwPExlBu8sZRuysoA&s",
                        height: 30,
                        width: 30),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ក្រុមហ៉ុនវីរះ ប៉ុនថាំ អេចប្រេស ខូអិលធីឌី",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "VIREAK BUNTHAM EXPRESS CO., LTD",
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                    child: Text(
                      "STAFF ID CARD",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border(), color: Colors.white),
                      height: 140,
                      width: 140,
                      child: ImageNetwork(
                        image:
                            'https://i.pinimg.com/474x/0a/a8/58/0aa8581c2cb0aa948d63ce3ddad90c81.jpg',
                        fitWeb: BoxFitWeb.contain,height: 140,
                        width: 140,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "រគ័ង គីមឡាយ",
                      style: TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "KUANG KIMLAY",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "ទីផ្សារ (ចិន)",
                      style:
                          TextStyle(color: Colors.blue.shade900, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: 200,
                      height: 1,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ID No                 :",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: ""),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Starting date      :",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: ""),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Expired Date      :",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: ""),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
