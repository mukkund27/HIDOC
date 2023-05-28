import 'package:demoproject/View/details_view.dart';
import 'package:demoproject/constant/app_text.dart';
import 'package:demoproject/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/all_data_model.dart';

class TrendingHidocBulletin extends StatelessWidget {
  final AllDataModel getData;
  final double h;
  final double w;

  const TrendingHidocBulletin({Key? key, required this.getData, required this.h, required this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.blue.shade50,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Trending Hidoc Bulletin",
              style: TextStyle(fontSize: Responsive.isDesktop(context) ? w / AppText.desktopHeading : w / AppText.mobileHeading, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: h / 35,
            ),
            SizedBox(
              height: Responsive.isDesktop(context)
                  ? double.parse(getData.data?.trandingBulletin?.length.toString() ?? "1") * w / 9.5
                  : double.parse(getData.data?.trandingBulletin?.length.toString() ?? "1") * w / 3.5  ,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: getData.data?.trandingBulletin?.length ?? 1,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getData.data?.trandingBulletin?[index].articleTitle ?? "",
                        maxLines: 2,
                        style: TextStyle(fontSize:Responsive.isDesktop(context)? w / AppText.desktopTitle:w/AppText.mobileTitle, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: w / 80,
                      ),
                      Text(
                        getData.data?.trandingBulletin?[index].articleDescription ?? "",
                        maxLines: 3,
                        style: TextStyle(fontSize:Responsive.isDesktop(context)? w / AppText.desktopDescription:w/AppText.mobileDescription, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: h / 80,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(
                              () => Details(
                                    title: getData.data?.trandingBulletin?[index].articleTitle ?? "",
                                    description: getData.data?.trandingBulletin?[index].articleDescription ?? "",

                                  ),
                              transition: Transition.downToUp);
                        },
                        child: Text(
                          "Read more",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize:Responsive.isDesktop(context)? w / AppText.desktopDescription:w/AppText.mobileDescription,
                            fontStyle: FontStyle.italic,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: w / 50,
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
