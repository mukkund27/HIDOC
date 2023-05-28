import 'package:demoproject/services/api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../Model/all_data_model.dart';

class GetAllDataController extends GetxController {
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getData();

    super.onInit();
  }

  var getAllDataModel = AllDataModel().obs;
  AllDataModel get getAllModelData => getAllDataModel.value;
  Future getData() async {
    try {
      var getDataResponse = await ApiService.getAlldata();
      if (getDataResponse != null) {
        getAllDataModel(getDataResponse);
        isLoading.value = false;
        update();
      }
    } catch (e) {
      isLoading.value = false;
      update();
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
