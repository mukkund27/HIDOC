import 'package:demoproject/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 

import '../Model/all_data_model.dart';
import '../View/details_view.dart';
import '../constant/app_text.dart';

class ExploreArticleView extends StatelessWidget {
  final AllDataModel getData;
  final double h;
  final double w;
  const ExploreArticleView({Key? key, required this.getData, required this.h, required this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      margin: EdgeInsets.only(bottom: w/30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Explore Article",
              style: TextStyle(fontSize:Responsive.isDesktop(context)? w /AppText.desktopHeading:w/AppText.mobileHeading, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: h / 35,
            ),
            SizedBox(
              height: Responsive.isDesktop(context)
                  ? double.parse(getData.data?.exploreArticle?.length.toString() ?? "1") * w / 9.2
                  : double.parse(getData.data?.exploreArticle?.length.toString() ?? "1") * w / 3.2  ,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: getData.data?.exploreArticle?.length ?? 1,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getData.data?.exploreArticle?[index].articleTitle ?? "",
                        maxLines: 2,
                        style: TextStyle(fontSize: Responsive.isDesktop(context)? w /AppText.desktopTitle:w/AppText.mobileTitle, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: w / 100,
                      ),
                      Text(
                        getData.data?.exploreArticle?[index].articleDescription ?? "",
                        maxLines: 3,
                        style: TextStyle(fontSize: Responsive.isDesktop(context)? w /AppText.desktopDescription:w/AppText.mobileDescription, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: w / 100,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => Details(
                            title: getData.data?.exploreArticle?[index].articleTitle ?? "",
                            description: getData.data?.exploreArticle?[index].articleDescription ?? "",
                          ),transition: Transition.downToUp);
                        },
                        child: Text(
                          "Read more",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: Responsive.isDesktop(context)? w /AppText.desktopDescription:w/AppText.mobileDescription,
                            fontStyle: FontStyle.italic,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h / 50,
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
