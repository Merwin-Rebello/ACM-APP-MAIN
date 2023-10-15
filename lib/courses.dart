import 'package:acm_app/globalComponents.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/link.dart';

import 'package:flutter/material.dart';

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);
  static const List<Map<String, dynamic>> courses = [
    {
      "title": "UI UX Workshop 2021 | Day 2 | App Design Tutorial",
      "youtubeID": "aG69hdEGVMw",
      "taughtBy": "Hariharan Iyer"
    },
    {
      "title": "UI UX Workshop 2021 - Figma",
      "youtubeID": "G4avMXza28Y",
      "taughtBy": "Hariharan Iyer, Grejo Joby"
    },
    {
      "title": "Unity Workshop 1 | Teknack 2021",
      "youtubeID": "5kHCgJj2EHY",
      "taughtBy": "Grejo Joby | Hayden Cordeiro"
    },
    {
      "title": "C++ Crash Course",
      "youtubeID": "bC4xxGlM5eA",
      "taughtBy": "Grejo Joby | Hayden Cordeiro | Pakshal Ranawat"
    },
    {
      "title": "Macromedia Flash Workshop",
      "youtubeID": "v4zxQ_q2Kzg",
      "taughtBy": "Hariharan Iyer"
    },
    {
      "title": "Illustrator Tutorial | Logo Designing",
      "youtubeID": "aBtZpZYKm38",
      "taughtBy": "Hariharan Iyer | Slade Ferrao"
    },
    {
      "title": "Git - GitHub Workshop | Version Control",
      "youtubeID": "Ilq9hrPDKyI",
      "taughtBy": "Grejo Joby"
    },
    {
      "title": "Domain, DNS and Web Hosting Workshop",
      "youtubeID": "13qLC8yJWtA",
      "taughtBy": "Noble Mavely"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer.Build(context),
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: 80,
          title: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for Courses',
                labelStyle: const TextStyle(color: Colors.black),
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Color(0xFF003261),
                    width: 4.0,
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: const Color(0xFF003261),
          centerTitle: true,
          elevation: 0,
          // shadowColor: Colors.blueGrey,
          // actions: [
          //   IconButton(onPressed: () {}, icon: Icon(Icons.lightbulb)),
          //   SizedBox(
          //     width: 15.w,
          //   )
          // ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.zero,
                height: 210.h,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CustomPaint(
                      painter: TopBar(50.r, const Color(0xFF003261)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Expanded(flex: 3, child: SizedBox()),
                        Text(
                          "COURSES",
                          style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(flex: 3, child: SizedBox()),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Flexible(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 210,
                      margin: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Link(
                          target: LinkTarget.blank,
                          uri: Uri.parse(
                              "https://www.youtube.com/watch?v=${courses[index]['youtubeID']}"),
                          builder: (context, followLink) {
                            return InkWell(
                              onTap: followLink,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    child: Image.network(
                                        'https://img.youtube.com/vi/${courses[index]['youtubeID']}/mqdefault.jpg',
                                        // width: 300,
                                        height: 100,
                                        fit: BoxFit.fitHeight),
                                  ),
                                  ListTile(
                                    title: Text(courses[index]['title']),
                                    subtitle: Text(courses[index]['taughtBy']),

                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
