import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:demoproject/WelcomeView/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
 

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ConnectivityAppWrapper(
      app: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home:   const WelcomeView(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: (context, widget) {
          return ConnectivityWidgetWrapper(
            disableInteraction: true,
            height: 80,
            child: widget!,
          );
        },
      ),
    );
  }
}
