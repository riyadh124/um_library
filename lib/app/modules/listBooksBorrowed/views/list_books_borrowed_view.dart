import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_books_borrowed_controller.dart';

class ListBooksBorrowedView extends GetView<ListBooksBorrowedController> {
  ListBooksBorrowedView({Key? key}) : super(key: key);
  ListBooksBorrowedController listBooksBorrowedController =
      Get.put(ListBooksBorrowedController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buku Dipinjam'),
          centerTitle: true,
        ),
        body:
            Obx(() => listBooksBorrowedController.isListBooksBorrowedExist.value
                ? ListView.separated(
                    shrinkWrap: true,
                    itemCount:
                        listBooksBorrowedController.listBooksBorrowed.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(
                            "http://192.168.1.8:8000/storage/${listBooksBorrowedController.listBooksBorrowed[index]["book"]["cover"]}"),
                        title: Text(
                          listBooksBorrowedController.listBooksBorrowed[index]
                              ["book"]["judul_buku"],
                        ),
                        subtitle: listBooksBorrowedController
                                        .listBooksBorrowed[index]["book"]
                                    ["overdue_fine"] !=
                                null
                            ? Text(
                                "Rp. ${listBooksBorrowedController.listBooksBorrowed[index]["book"]["overdue_fine"]}")
                            : Text("Belum ada denda"),
                        trailing: Text(
                            listBooksBorrowedController.formatDatetime(
                                DateTime.parse(listBooksBorrowedController
                                    .listBooksBorrowed[index]["borrowed_at"]))),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
