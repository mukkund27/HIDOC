import 'package:demoproject/widgets/responsive.dart';
import 'package:flutter/material.dart';

import '../constant/app_text.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Responsive.isDesktop(context)
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
    );
  }
}
