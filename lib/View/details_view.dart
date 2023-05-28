import 'package:flutter/material.dart';

import '../constant/app_text.dart';
import '../widgets/responsive.dart';

class Details extends StatelessWidget {
  final String title;
  final String description;

  const Details({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Details")),
      body: SafeArea(
          child: SizedBox(
        width: w,
        child: Card(
          margin:
              EdgeInsets.all(Responsive.isDesktop(context) ? w / 45 : w / 22),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: w / 50,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: Responsive.isDesktop(context)
                            ? w / AppText.desktopTitle
                            : w / AppText.mobileTitle,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: w / 50,
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: Responsive.isDesktop(context)
                            ? w / AppText.desktopDescription
                            : w / AppText.mobileDescription,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: w / 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
