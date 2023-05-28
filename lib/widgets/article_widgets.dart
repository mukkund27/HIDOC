import 'package:demoproject/Model/all_data_model.dart';
import 'package:demoproject/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 

import '../View/details_view.dart';
import '../constant/app_text.dart';

class ArticleWidget extends StatelessWidget {
  final AllDataModel getData;
  const ArticleWidget({Key? key, required this.getData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    final w = MediaQuery.of(context).size.width;
    return Responsive.isDesktop(context)
        ? Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(children: [
          Image.asset(
            "assets/images/news_image.jpg",
            height: w / 6.8,
            width: w / 4,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: w / 25,
              width: w / 23,
              decoration: const BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Points",
                      style: TextStyle(fontSize: w / AppText.desktopDescription, color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      getData.data?.article?.rewardPoints.toString() ?? "",
                      style: TextStyle(fontSize: w / AppText.desktopDescription, color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(w / 150),
                child: Text(
                  getData.data?.article?.articleTitle ?? "",
                  style: TextStyle(fontSize: w / AppText.desktopTitle, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(w / 150),
                child: Text(
                  getData.data?.article?.articleDescription ?? " ",
                  style: TextStyle(fontSize: w / AppText.desktopDescription, fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: w / 250, left: w / 150),
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                            () => Details(
                          title: getData.data?.article?.articleTitle ?? "",
                          description: getData.data?.article?.articleDescription ?? " ",

                        ),
                        transition: Transition.downToUp);
                  },
                  child: Text(
                    "Read full article to earn point",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: w / AppText.desktopDescription,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: w / 120,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Published Date: ${getData.data?.article?.createdAt ?? " "}",
                  style: TextStyle(fontSize: w / AppText.desktopDescription, color: Colors.grey.shade400, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        )
      ],
    )
        : Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              "assets/images/news_image.jpg",
              height: w / 2.5,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              getData.data?.article?.articleTitle ?? "",
              style: TextStyle(fontSize: w / AppText.mobileTitle, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(w / 58.0),
            child: Text(
              getData.data?.article?.articleDescription ?? " ",
              style: TextStyle(fontSize: w / AppText.mobileDescription, fontWeight: FontWeight.normal),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: w / 38.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                            () => Details(
                          title: getData.data?.article?.articleTitle ?? "",
                          description: getData.data?.article?.articleDescription ?? " ",

                        ),
                        transition: Transition.downToUp);
                  },
                  child: Text(
                    "Read full article to earn point",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: w / AppText.mobileDescription,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                height: w / 8,
                width: w / 8,
                decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Points",
                        style: TextStyle(fontSize: w / AppText.mobileDescription, color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        getData.data?.article?.rewardPoints.toString() ?? "",
                        style: TextStyle(fontSize: w / AppText.mobileDescription, color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
