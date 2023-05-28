import 'package:demoproject/widgets/responsive.dart';
import 'package:flutter/material.dart';
import '../Model/all_data_model.dart';
import '../constant/app_text.dart';

class LatestArticle extends StatelessWidget {
  final AllDataModel getData;
  final double h;
  final double w;

  const LatestArticle({Key? key, required this.getData, required this.h, required this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Latest Articles",
            style: TextStyle(fontSize: Responsive.isDesktop(context) ? w / AppText.desktopHeading : w / AppText.mobileHeading, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Colors.grey.shade500,
          ),
          SizedBox(
            height: getData.data!.latestArticle!.isEmpty
                ? h/20
                : Responsive.isDesktop(context)
                    ? double.parse(getData.data?.latestArticle?.length.toString() ?? "1") * w / 6.1
                    : double.parse(getData.data?.latestArticle?.length.toString() ?? "1") * w / 3,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  if (getData.data!.latestArticle!.isNotEmpty) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: h / 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              getData.data?.latestArticle?[index].articleTitle ?? "",
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
                itemCount: getData.data!.latestArticle!.length),
          )
        ],
      ),
    );
  }
}
