import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';

import 'package:flutter/material.dart';

import '../model_screen.dart';
import '../recent_files.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          topcontainer(),
          SizedBox(
            height: 30,
          ),
          getRecentFiles(),
          SizedBox(
            height: 30,
          ),
          getCategoryFiles(),
        ],
      ),
    ));
  }

  Widget topcontainer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blue),
      child: Stack(children: [
        Positioned(
          bottom: -40,
          right: -30,
          child: Container(
            height: 120,
            width: 120,
            decoration:
                BoxDecoration(color: Colors.blue[300], shape: BoxShape.circle),
          ),
        ),
        Positioned(
          bottom: -10,
          left: -45,
          child: Container(
            height: 70,
            width: 70,
            decoration:
                BoxDecoration(color: Colors.blue[300], shape: BoxShape.circle),
          ),
        ),
        Container(
          width: double.infinity,
          height: 120,
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  child: CircleProgressBar(
                    foregroundColor: Colors.white,
                    value: 0.68,
                    backgroundColor: Colors.white24,
                    child: Center(
                      child: AnimatedCount(
                        style: TextStyle(color: Colors.white),
                        count: 0.68,
                        unit: '%',
                        duration: Duration(milliseconds: 500),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "10.8 GB of 15 GB used",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 12,
                            right: 12,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Text(
                            "Buy Storage",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }

  Widget getRecentFiles() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recents Files",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(recentFilesJson.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Container(
                  width: size.width * 0.6,
                  height: 160,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(22),
                      image: DecorationImage(
                          image: NetworkImage(recentFilesJson[index]["img"]),
                          fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BlurryContainer(
                        blur: 5,
                        padding: EdgeInsets.zero,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                          bottomRight: Radius.circular(22),
                        ),
                        child: Container(
                          width: size.width * 0.6,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.white24),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recentFilesJson[index]["file_name"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            })),
          )
        ],
      ),
    );
  }

  Widget getCategoryFiles() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: 2, right: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Category",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
              categoryJson.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                    height: 150,
                    width: 140,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(22)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          categoryJson[index]["imge"],
                          width: 40,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          categoryJson[index]["text"],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          categoryJson[index]['file_count'],
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                );
              },
            )),
          )
        ],
      ),
    );
  }
}
