import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:um_library/app/components/dialog.dart';
import 'package:um_library/app/services/authService.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  GetStorage box = GetStorage();
  var barcodeAttendanceResult;
  var barcodeBookResult;

  formatDatetime(DateTime date) {
    var formated = DateFormat('dd MMMM, yyyy').format(date);
    return formated.toString();
  }

  scanBarcodeAttendance() async {
    var res = await Navigator.push(
        Get.context!,
        MaterialPageRoute(
          builder: (context) => const SimpleBarcodeScannerPage(),
        ));
    if (res is String) {
      barcodeAttendanceResult = res;
    }
    print("result : $barcodeAttendanceResult");

    String expectedBarcode =
        "Attendance-${DateFormat('yyyy-MM-dd').format(DateTime.now())}";

    if (barcodeAttendanceResult == expectedBarcode) {
      authService().attendance(Get.context, barcodeAttendanceResult);
    } else {
      errorMessage("Barcode daftar hadir tidak valid");
    }
  }

  scanBookCode() async {
    var res = await Navigator.push(
        Get.context!,
        MaterialPageRoute(
          builder: (context) => const SimpleBarcodeScannerPage(),
        ));
    if (res is String) {
      barcodeBookResult = res;
    }
    print("result : $barcodeBookResult");

    if (barcodeBookResult != null) {
      authService().scanBook(Get.context, barcodeBookResult);
    } else {
      errorMessage("Barcode buku tidak valid");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
