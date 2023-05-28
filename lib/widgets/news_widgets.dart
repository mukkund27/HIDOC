import 'package:demoproject/widgets/responsive.dart';
import 'package:flutter/material.dart';

import '../constant/app_text.dart';

// ignore: must_be_immutable
class NewsWidgets extends StatelessWidget {
  NewsWidgets({Key? key}) : super(key: key);
  List<Map<String, dynamic>> list = [
    {
      "Icon": "assets/images/trophy.png",
      "Title": "Quizzes : ",
      "Description": "Participate & Win Exciting Prizes"
    },
    {
      "Icon": "assets/images/calculator.png",
      "Title": "Medical Calculators : ",
      "Description": "Get Access to 800+ Evidence Based Calculators"
    },
  ];
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Responsive.isDesktop(context)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      border: Border.all(color: Colors.black45)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "News ",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: w / AppText.desktopHeading,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: h / 50,
                            ),
                            SizedBox(
                                width: w / 5,
                                child: Text(
                                  "Expert Addressing burnout discuss the importance not only of self-care,but also of improving workplace conditions. ",
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: w / AppText.desktopDescription),
                                )),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        "assets/images/news_image.jpg",
                        height: w / 5,
                        width: w / 4,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: w / 100,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: w / 50,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black45)),
                  child: SizedBox(
                    height: w / 8,
                    child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: w / 25,
                                  width: w / 25,
                                  margin: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.shade300),
                                  child: Center(
                                    child: Image.asset(
                                      list[index]["Icon"],
                                      color: Colors.blue,
                                      fit: BoxFit.cover,
                                      height: w / 50,
                                      width: w / 50,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: w / 100,
                                ),
                                SizedBox(
                                  width: w / 14,
                                  child: Text(
                                    list[index]["Title"],
                                    style: TextStyle(
                                        fontSize: w / AppText.desktopTitle,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: w / 8,
                                  child: Text(
                                    list[index]["Description"],
                                    style: TextStyle(
                                        fontSize:
                                            w / AppText.desktopDescription,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: Colors.grey.shade400,
                          );
                        },
                        itemCount: 2),
                  ),
                ),
              )
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: w / 1,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "News ",
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: w / AppText.mobileTitle,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: h / 50,
                          ),
                          SizedBox(
                              width: w / 1.2,
                              child: Text(
                                "Expert Addressing burnout discuss the importance not only of self-care,but also of improving workplace conditions. ",
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: w / AppText.mobileDescription),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h / 10,
                    ),
                    Image.asset(
                      "assets/images/news_image.jpg",
                      height: w / 2.2,
                      width: w / 1,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              SizedBox(height: h / 30),
              Container(
                padding: const EdgeInsets.all(12),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black45)),
                child: SizedBox(
                  height: w / 2.8,
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: w / 8,
                                width: w / 8,
                                margin: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300),
                                child: Center(
                                  child: Image.asset(
                                    list[index]["Icon"],
                                    color: Colors.blue,
                                    fit: BoxFit.cover,
                                    height: w / 25,
                                    width: w / 25,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: w / 100,
                              ),
                              SizedBox(
                                width: w / 4.5,
                                child: Text(
                                  list[index]["Title"],
                                  style: TextStyle(
                                      fontSize: w / AppText.mobileTitle,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: w / 2.2,
                                child: Text(
                                  list[index]["Description"],
                                  style: TextStyle(
                                      fontSize: w / AppText.mobileDescription,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.grey.shade400,
                        );
                      },
                      itemCount: 2),
                ),
              ),
            ],
          );
  }
}
