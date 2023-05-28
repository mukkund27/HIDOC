import 'package:demoproject/Controller/all_data_controller.dart';
import 'package:demoproject/constant/app_text.dart';
import 'package:demoproject/widgets/latest_article.dart';
import 'package:demoproject/widgets/responsive.dart';
import 'package:demoproject/widgets/trending_article.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
 
import '../widgets/article_widgets.dart';
import '../widgets/dropdown.dart';
import '../widgets/explore_more_in_article.dart';
import '../widgets/expolre_article.dart';
import '../widgets/hidoc_bulletin.dart';
import '../widgets/news_widgets.dart';
import '../widgets/trending_hidoc_bulletin.dart';
 

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final getAllDataController = Get.put(GetAllDataController());


  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Obx(
      () {
        var getData = getAllDataController.getAllDataModel();
        return WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop();
            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.grey.shade200,
            body: getAllDataController.isLoading.value == false
                ? SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: Responsive.isDesktop(context) ? w / 32 : w / 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Responsive.isDesktop(context)
                                ? Padding(
                                    padding: EdgeInsets.symmetric(vertical: h / 50),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(w / 100),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.white, width: 4),
                                            ),
                                            child: Icon(
                                              Icons.home,
                                              size: w / 40,
                                              color: Colors.white,
                                            )),
                                        Text(
                                          "ARTICLES",
                                          style: TextStyle(fontSize: w / AppText.desktopHeading, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: w / 15,
                                        )
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.symmetric(vertical: h / 80),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(w / 80),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.white, width: 4),
                                            ),
                                            child: Icon(
                                              Icons.home,
                                              size: h / 30,
                                              color: Colors.white,
                                            )),
                                        Text(
                                          "ARTICLES",
                                          style: TextStyle(fontSize: w / AppText.mobileHeading, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: w / 15,
                                        )
                                      ],
                                    ),
                                  ),
                            Align(alignment: Alignment.center, child: DropDown(h: h, w: w)),
                            SizedBox(
                              height: h / 45,
                            ),
                            ArticleWidget(getData: getData),
                            SizedBox(
                              height: h / 35,
                            ),
                            Responsive.isDesktop(context)
                                ? Divider(
                                    color: Colors.grey.shade500,
                                  )
                                : const SizedBox(),
                            SizedBox(
                              height: Responsive.isDesktop(context) ? h / 35 : 0,
                            ),
                            Responsive.isDesktop(context)
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: HidocBulletin(getData: getData, w: w, h: h),
                                      ),
                                      Expanded(flex: 2, child: TrendingHidocBulletin(getData: getData, h: h, w: w)),
                                    ],
                                  )
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      HidocBulletin(getData: getData, w: w, h: h),
                                      TrendingHidocBulletin(getData: getData, h: h, w: w),
                                    ],
                                  ),
                            SizedBox(
                              height: h / 35,
                            ),
                            ExploreArticleView(
                              getData: getData,
                              h: h,
                              w: w,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: MaterialButton(
                                onPressed: () {},
                                color: Responsive.isDesktop(context) ? Colors.blue : Colors.orange,
                                minWidth: Responsive.isDesktop(context) ? w / 3 : w / 2,
                                height: h / 18,
                                child: const Text(
                                  "Read More Bulletins",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: h / 35,
                            ),
                            Responsive.isDesktop(context)
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(flex: 3, child: LatestArticle(getData: getData, h: h, w: w)),
                                      SizedBox(
                                        width: w / 100,
                                      ),
                                      Expanded(flex: 3, child: TrendingArticle(getData: getData, h: h, w: w)),
                                      SizedBox(
                                        width: w / 100,
                                      ),
                                      Expanded(flex: 3, child: ExploreMoreArticle(getData: getData, h: h, w: w)),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      LatestArticle(getData: getData, h: h, w: w),
                                      SizedBox(
                                        height: h / 30,
                                      ),
                                      TrendingArticle(getData: getData, h: h, w: w),
                                      SizedBox(
                                        height: h / 30,
                                      ),
                                      ExploreMoreArticle(getData: getData, h: h, w: w),
                                    ],
                                  ),
                            SizedBox(
                              height: h / 35,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "What's more on Hidoc Dr.",
                                style: TextStyle(color: Colors.black, fontSize: Responsive.isDesktop(context) ? w / AppText.desktopHeading : w / AppText.mobileHeading, fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: h / 20,
                            ),
                            NewsWidgets(),
                            SizedBox(
                              height: h / 20,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: Responsive.isDesktop(context) ? 15 : 15, vertical: Responsive.isDesktop(context) ? 15 : 15),
                              decoration: BoxDecoration(
                                color: Responsive.isDesktop(context) ? Colors.lightBlueAccent.shade100 : Colors.orange.shade200,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: Responsive.isDesktop(context) ? w / 1.5 : w / 1.8,
                                    child: Text(
                                      "Social Network for doctors - A Special on Hidoc Dr.",
                                      maxLines: 2,
                                      style: TextStyle(fontSize: Responsive.isDesktop(context) ? w / AppText.desktopHeading : w / AppText.mobileTitle, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () {},
                                    color: Responsive.isDesktop(context) ? Colors.lightBlue : Colors.orange,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                    child: Text(
                                      "Visit",
                                      style: TextStyle(color: Colors.white, fontSize: Responsive.isDesktop(context) ? w / AppText.desktopTitle : w / AppText.mobileDescription),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: h / 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const Material(
                    child: Center(
                    child: CircularProgressIndicator(),
                  )),
          ),
        );
      },
    );
  }
}
