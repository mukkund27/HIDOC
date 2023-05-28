import 'package:demoproject/constant/app_text.dart';
import 'package:demoproject/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/all_data_model.dart';
import '../View/details_view.dart';

class HidocBulletin extends StatelessWidget {
  final AllDataModel getData;
  final double h;
  final double w;

  const HidocBulletin({Key? key, required this.getData, required this.h, required this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hidoc Bulletin",
          style: TextStyle(fontSize: Responsive.isDesktop(context) ? w / AppText.desktopHeading : w / AppText.mobileHeading, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: Responsive.isDesktop(context) ? double.parse(getData.data?.bulletin?.length.toString() ?? "1") * w / 6.1 : double.parse(getData.data?.bulletin?.length.toString() ?? "1") * w / 2.6,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(color:Responsive.isDesktop(context)? index==0?Colors.grey.shade300:Colors.transparent:Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: h / 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.blue,
                          height: h / 150,
                          margin: EdgeInsets.only(right: w / 5,bottom: h/100,top: h/150 ),
                          width: w / 10,
                        ),
                        Text(
                          getData.data?.bulletin?[index].articleTitle ?? "",
                          maxLines: 2,
                          style: TextStyle(fontSize: Responsive.isDesktop(context) ? w / AppText.desktopTitle : w / AppText.mobileTitle, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: w / 80,
                        ),                  Text(
                          getData.data?.bulletin?[index].articleDescription ?? "",
                          maxLines: 3,
                          style: TextStyle(fontSize: Responsive.isDesktop(context) ? w / AppText.desktopDescription : w / AppText.mobileDescription, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: w / 80,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                                () => Details(
                                      title: getData.data?.bulletin?[index].articleTitle ?? "",
                                      description: getData.data?.bulletin?[index].articleDescription ?? "",

                                    ),
                                transition: Transition.downToUp);
                          },
                          child: Text(
                            "Read more",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: Responsive.isDesktop(context) ? w / AppText.desktopDescription : w / AppText.mobileDescription,
                              fontStyle: FontStyle.italic,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: getData.data?.bulletin?.length ?? 1),
        ),
      ],
    );
  }
}
