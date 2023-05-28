import 'package:demoproject/widgets/responsive.dart';
import 'package:flutter/material.dart';
import '../Model/all_data_model.dart';
import '../constant/app_text.dart';

class TrendingArticle extends StatelessWidget {
  final AllDataModel getData;
  final double h;
  final double w;

  const TrendingArticle({Key? key, required this.getData, required this.h, required this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Trending Articles",
            style: TextStyle(fontSize: Responsive.isDesktop(context) ? w / AppText.desktopHeading : w / AppText.mobileHeading, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Colors.grey.shade500,
          ),
          SizedBox(
            height: getData.data!.trandingArticle!.isEmpty
                ? h / 20
                : Responsive.isDesktop(context)
                    ? double.parse(getData.data?.trandingArticle?.length.toString() ?? "1") * w / 7
                    : double.parse(getData.data?.trandingArticle?.length.toString() ?? "1") * w / 2.6,
            child: ListView.separated(physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (getData.data!.trandingArticle!.isNotEmpty) {
                    if (index == 0) {
                      return Padding(
                          padding: EdgeInsets.symmetric(vertical: h / 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/news_image.jpg",
                                height: Responsive.isDesktop(context) ? w / 8 : w / 2.5,
                                width: Responsive.isDesktop(context) ? w / 2 : w / 1.1,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: h / 50,
                              ),
                              Text(
                                getData.data?.trandingArticle?[index].articleTitle ?? "",
                                maxLines: 2,
                                style: TextStyle(fontSize: Responsive.isDesktop(context) ? w / AppText.desktopTitle : w / AppText.mobileTitle, fontWeight: FontWeight.normal),
                              ),
                            ],
                          ));
                    } else {
                      return Padding(
                          padding: EdgeInsets.symmetric(vertical: h / 100),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/images/news_image.jpg",
                                height:Responsive.isDesktop(context)? w / 30:w/15,
                                width:Responsive.isDesktop(context)? w / 25:w/10,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: w / 100,
                              ),
                              SizedBox(
                                width: Responsive.isDesktop(context) ? w / 5.5 : w / 1.5,
                                child: Text(
                                  getData.data?.trandingArticle?[index].articleTitle ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(fontSize: Responsive.isDesktop(context) ? w / AppText.desktopTitle : w / AppText.mobileTitle, fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ));
                    }
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
                itemCount: getData.data!.trandingArticle!.length),
          )
        ],
      ),
    );
  }
}
