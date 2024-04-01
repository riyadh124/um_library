import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:um_library/app/env/colors.dart';
import 'package:um_library/app/modules/listBooksBorrowed/views/list_books_borrowed_view.dart';
import 'package:um_library/app/modules/profile/views/profile_view.dart';
import 'package:um_library/app/modules/searchBook/views/search_book_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFEFEFE),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: MediaQuery.sizeOf(context).width - 48 - 100,
                            child: RichText(
                              text: TextSpan(
                                  text: "Selamat Datang, \n",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                  children: [
                                    TextSpan(
                                        text:
                                            "${homeController.box.read("userData")["name"]}!",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ]),
                            )),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Hari ini ${homeController.formatDatetime(DateTime.now())}",
                          style: TextStyle(color: Color(0xFFB2B2B2)),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ProfileView());
                      },
                      child: CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: primaryColor,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              "assets/images/student.png",
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    homeController.scanBarcodeAttendance();
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Isi Daftar Hadir",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width - 250,
                                child: Text(
                                  "Klik untuk scan barcode daftar hadir",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          height: 100,
                          width: 100,
                          child: Icon(
                            Icons.qr_code_scanner,
                            size: 80,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pinjam Buku Sekarang!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Temukan buku dengan scan barcode dan baca sekarang.",
                      style: TextStyle(color: Color(0xFFB2B2B2), fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    homeController.scanBookCode();
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 100,
                            child: Icon(
                              Icons.qr_code_2,
                              size: 70,
                            ),
                            width: 80,
                            decoration: BoxDecoration(
                                color: Color(0xFFF9F9F9),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Scan Kode Buku",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width - 210,
                                child: Text(
                                  "Klik disini untuk pinjam buku, berdasarkan code batang.",
                                  style: TextStyle(
                                      color: Color(0xFFB2B2B2), fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SearchBookView());
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 100,
                            child: Icon(
                              Icons.search,
                              size: 70,
                            ),
                            width: 80,
                            decoration: BoxDecoration(
                                color: Color(0xFFF9F9F9),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cari Kode Buku",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width - 210,
                                child: Text(
                                  "Klik disini untuk pinjam buku, berdasarkan kode buku.",
                                  style: TextStyle(
                                      color: Color(0xFFB2B2B2), fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => ListBooksBorrowedView());
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 100,
                            child: Icon(
                              Icons.library_books,
                              size: 70,
                            ),
                            width: 80,
                            decoration: BoxDecoration(
                                color: Color(0xFFF9F9F9),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Buku Dipinjam",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width - 210,
                                child: Text(
                                  "Klik disini untuk melihat buku yang sedang dipinjam.",
                                  style: TextStyle(
                                      color: Color(0xFFB2B2B2), fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
