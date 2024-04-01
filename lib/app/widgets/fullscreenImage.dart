import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenImage extends StatelessWidget {
  final String imageFile;
  final Function onDelete;

  FullScreenImage({required this.imageFile, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gambar Fullscreen'),
          // actions: [
          //   GetBuilder<CreateWOController>(
          //       init: CreateWOController(),
          //       builder: (createWOController) {
          //         return IconButton(
          //           icon: Icon(Icons.delete),
          //           onPressed: () {
          //             if (createWOController.detailWorkorderData != null) {
          //               if (createWOController.detailWorkorderData["data"][0]
          //                       ["workorder_status"] !=
          //                   "COMPLETE") {
          //                 onDelete();
          //                 Navigator.pop(context);
          //               }
          //             } else {
          //               onDelete();
          //               Navigator.pop(context);
          //             }
          //           },
          //         );
          //       }),
          // ],
        ),
        body: Image.network(
          imageFile,
          fit: BoxFit.fill,
        ));
  }
}
