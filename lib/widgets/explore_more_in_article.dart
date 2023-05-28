import 'package:demoproject/widgets/responsive.dart';
import 'package:flutter/material.dart';
 

import '../Model/all_data_model.dart';
 
import '../constant/app_text.dart';

class ExploreMoreArticle extends StatelessWidget {
  final AllDataModel getData;
  final double h;
  final double w;

  const ExploreMoreArticle({Key? key, required this.getData, required this.h, required this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Explore More in Articles",
                style: TextStyle(fontSize: Responsive.isDesktop(context) ? w / AppText.desktopHeading : w / AppText.mobileHeading, fontWeight: FontWeight.bold),
              ),
              Divider(
                color: Colors.grey.shade500,
              ),
              SizedBox(
                height: getData.data!.exploreArticle!.isEmpty
                    ? h / 20
                    : Responsive.isDesktop(context)
                        ? double.parse(getData.data?.exploreArticle?.length.toString() ?? "1") * w / 16
                        : double.parse(getData.data?.exploreArticle?.length.toString() ?? "1") * w / 6,
                child: ListView.separated(physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (getData.data!.exploreArticle!.isNotEmpty) {
                        return Padding(
                            padding: EdgeInsets.symmetric(vertical: h / 150),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getData.data?.exploreArticle?[index].articleTitle ?? "",
                                  maxLines: 2,
                                  style: TextStyle(fontSize: Responsive.isDesktop(context) ? w / AppText.desktopTitle : w / AppText.mobileTitle, fontWeight: FontWeight.normal),
                                ),
                              ],
                            ));
                      } else {
                        return Text(
                          "No Article Found",
                          style: TextStyle(color: Colors.black, fontSize: Responsive.isDesktop(context) ? w / AppText.desktopTitle : w / AppText.mobileTitle, fontWeight: FontWeight.bold),
                        );
                      }
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.grey.shade500,
                      );
                    },
                    itemCount: getData.data!.exploreArticle!.length),
              ),

            ],
          ),
        ),
        SizedBox(height: h/50,),
        Align(
          alignment: Alignment.center,
          child: MaterialButton(
            onPressed: () {},
            color: Responsive.isDesktop(context) ? Colors.blue : Colors.orange,
            minWidth: Responsive.isDesktop(context) ? w / 3 : w / 2,
            height: h / 18,
            child: const Text(
              "Explore Hidoc Dr.",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
