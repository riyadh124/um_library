import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:um_library/app/env/colors.dart';
import 'package:um_library/app/services/authService.dart';
import 'package:um_library/app/widgets/button.dart';

import '../controllers/search_book_controller.dart';

class SearchBookView extends GetView<SearchBookController> {
  SearchBookView({Key? key}) : super(key: key);
  SearchBookController searchBookController = Get.put(SearchBookController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Cari Buku'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ListTile(
              title: TextField(
                onChanged: (value) {
                  authService().getDataBook(context, value);
                },
                decoration: InputDecoration(
                  hintText: 'Kode buku...',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 28,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Obx(() => searchBookController.isBookExist.value
                ? SizedBox(
                    height: MediaQuery.sizeOf(context).height - 200,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Image.network(
                            "http://103.175.221.242/storage/${searchBookController.dataBook["cover"]}",
                            height: 200,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 8.0),
                          child: Text(
                            "Judul Buku : ${searchBookController.dataBook["judul_buku"]}" ??
                                '',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff222222),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 8.0),
                          child: Text(
                            "Pengarang : ${searchBookController.dataBook["pengarang"]}" ??
                                '',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff222222),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 8.0),
                          child: Text(
                            "Jumlah : ${searchBookController.dataBook["jumlah_buku"]}" ??
                                '',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff222222),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 8.0),
                          child: Text(
                            "Penerbit : ${searchBookController.dataBook["penerbit"]}" ??
                                '',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff222222),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 8.0),
                          child: Text(
                            "Tahun Terbit : ${searchBookController.dataBook["tahun_terbit"]}" ??
                                '',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff222222),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 8.0),
                          child: Text(
                            "Kode Buku : ${searchBookController.dataBook["kode_buku"]}" ??
                                '',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff222222),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: PrimaryButton(
                              text: "Pinjam",
                              onTap: () {
                                print(
                                    "kode buku : ${searchBookController.dataBook["kode_buku"]}");
                                authService().borrowBook(context,
                                    searchBookController.dataBook["id"]);
                              }),
                        )
                      ],
                    ),
                  )
                : SizedBox())
          ],
        ));
  }
}
