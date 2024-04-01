import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:um_library/app/components/dialog.dart';
import 'package:um_library/app/components/loading.dart';
import 'package:um_library/app/env/global_var.dart';
import 'package:um_library/app/modules/home/controllers/home_controller.dart';
import 'package:um_library/app/modules/home/views/home_view.dart';
import 'package:um_library/app/modules/listBooksBorrowed/controllers/list_books_borrowed_controller.dart';
import 'package:um_library/app/modules/login/controllers/login_controller.dart';
import 'package:um_library/app/modules/login/views/login_view.dart';
import 'package:um_library/app/modules/profile/controllers/profile_controller.dart';
import 'package:um_library/app/modules/register/controllers/register_controller.dart';
import 'package:um_library/app/modules/searchBook/controllers/search_book_controller.dart';
import 'package:um_library/app/modules/updateProfile/views/update_profile_view.dart';

class authService extends GetConnect {
  GetStorage box = GetStorage();

  void login(context) async {
    LoginController loginController = Get.put(LoginController());
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

    String email = loginController.emailController.text;
    String password = loginController.passwordController.text;
    String? token = await firebaseMessaging.getToken();

    if (email != '' && password != '') {
      showLoading();

      try {
        final response = await post('$urlApi/auth/login',
            {'email': email, 'password': password, 'fcm_token': token});

        var data = response.body;

        print("response $data");
        if (data != null) {
          if (data['message'] == 'User Logged In Successfully') {
            box.write("userData", data["data"]);
            box.write("token", data["token"]);
            onLoadingDismiss();
            Get.offAll(() => HomeView());
            successMessage(context, data['message']);
          } else {
            onLoadingDismiss();
            errorMessage(data['message']);
          }
        } else {
          onLoadingDismiss();
          errorMessage("Gagal masuk");
        }
      } catch (e) {
        onLoadingDismiss();
        errorMessage(e);
      }
    } else {
      errorMessage("Lengkapi Email dan Password terlebih dahulu.");
    }
  }

  void attendance(context, code) async {
    HomeController homeController = Get.put(HomeController());

    showLoading();
    print("user id : ${homeController.box.read("userData")["id"]}");

    print("barcode : ${code}");
    try {
      final response = await post('$urlApi/attendance', {
        'user_id': homeController.box.read("userData")["id"],
        'barcode': code
      }, headers: {
        'Authorization': "Bearer ${homeController.box.read("token")}"
      });

      var data = response.body;

      print("response $data");
      if (data != null) {
        if (data['message'] == 'Attendance recorded successfully') {
          onLoadingDismiss();
          successMessage(context, data['message']);
        } else {
          onLoadingDismiss();
          errorMessage(data['message']);
        }
      } else {
        onLoadingDismiss();
        errorMessage("Gagal masuk");
      }
    } catch (e) {
      onLoadingDismiss();
      errorMessage(e);
    }
  }

  void scanBook(context, String bookCode) async {
    HomeController homeController = Get.put(HomeController());

    showLoading();

    String bookBarcode = bookCode;
    print("code buku :${bookBarcode}");
    try {
      final response = await get('$urlApi/books/$bookBarcode', headers: {
        'Authorization': "Bearer ${homeController.box.read("token")}"
      });

      var data = response.body;

      print("response $data");
      if (data != null) {
        if (data['status'] == 'success') {
          onLoadingDismiss();
          confirmBookMessage(
              context,
              "Pinjam Buku",
              "Yakin ingin meminjam buku berikut?",
              data["data"]["cover"],
              data["data"]["kode_buku"],
              data["data"]["judul_buku"],
              data["data"]["pengarang"],
              data["data"]["penerbit"],
              data["data"]["tahun_terbit"],
              data["data"]["status"],
              data["data"]["id"], () {
            authService().borrowBook(context, data["data"]["id"]);
          });
          // successMessage(context, data['status']);
        } else {
          onLoadingDismiss();
          errorMessage(data['status']);
        }
      } else {
        onLoadingDismiss();
        errorMessage("Gagal mengambil buku");
      }
    } catch (e) {
      onLoadingDismiss();
      errorMessage(e);
    }
  }

  void getDataBook(context, String bookCode) async {
    GetStorage box = GetStorage();
    SearchBookController searchBookController = Get.put(SearchBookController());

    // showLoading();

    String bookBarcode = bookCode;
    print("code buku :${bookBarcode}");
    try {
      final response = await get('$urlApi/books/$bookBarcode',
          headers: {'Authorization': "Bearer ${box.read("token")}"});

      var data = response.body;

      print("response $data");
      if (data != null) {
        if (data['status'] == 'success') {
          // onLoadingDismiss();
          searchBookController.setDataBook(data);
          successMessage(context, data['status']);
        } else {
          // onLoadingDismiss();
          // errorMessage(data['status']);
        }
      } else {
        // onLoadingDismiss();
        errorMessage("Gagal mengambil buku");
      }
    } catch (e) {
      onLoadingDismiss();
      errorMessage(e);
    }
  }

  void getBorrowedBook(context) async {
    GetStorage box = GetStorage();
    ListBooksBorrowedController listBooksBorrowedController =
        Get.put(ListBooksBorrowedController());

    showLoading();

    try {
      final response = await get('$urlApi/books',
          headers: {'Authorization': "Bearer ${box.read("token")}"});

      var data = response.body;

      print("response $data");
      if (data != null) {
        if (data['status'] == 'success') {
          onLoadingDismiss();
          listBooksBorrowedController.setDataListBooksBorrowed(data);
        } else {
          onLoadingDismiss();
          errorMessage(data['status']);
        }
      } else {
        onLoadingDismiss();
        errorMessage("Gagal mengambil buku");
      }
    } catch (e) {
      onLoadingDismiss();
      errorMessage(e);
    }
  }

  void borrowBook(context, codeBuku) async {
    GetStorage box = GetStorage();

    showLoading();

    try {
      final response = await post('$urlApi/borrow-book',
          {'user_id': box.read("userData")["id"], 'book_id': codeBuku},
          headers: {'Authorization': "Bearer ${box.read("token")}"});

      var data = response.body;

      print("response $data");
      if (data != null) {
        if (data['message'] == 'Data peminjaman berhasil disimpan.') {
          onLoadingDismiss();
          Get.back();
          successMessage(context, data['message']);
        } else if (data['message'] == 'Data pengguna tidak lengkap.') {
          Get.to(() => UpdateProfileView());
          onLoadingDismiss();
          errorMessage(data['message']);
        } else {
          onLoadingDismiss();
          errorMessage(data['message']);
        }
      } else {
        onLoadingDismiss();
        errorMessage("Gagal masuk");
      }
    } catch (e) {
      onLoadingDismiss();
      errorMessage(e);
    }
  }

  void updateUser(context, nim, ktm, noTel) async {
    GetStorage box = GetStorage();

    showLoading();

    try {
      final response = await post(
          '$urlApi/update-data', {'nim': nim, 'ktm': ktm, 'no_telepon': noTel},
          headers: {'Authorization': "Bearer ${box.read("token")}"});

      var data = response.body;

      print("response $data");
      if (data != null) {
        if (data['message'] == 'User data updated successfully') {
          Get.back();
          successMessage(context, data['message']);
          getUser(context);
        } else {
          onLoadingDismiss();
          errorMessage(data['message']);
        }
      } else {
        onLoadingDismiss();
        errorMessage("Gagal mengirim data");
      }
    } catch (e) {
      onLoadingDismiss();
      errorMessage(e);
    }
  }

  void getUser(context) async {
    GetStorage box = GetStorage();
    ProfileController profileController = Get.put(ProfileController());
    try {
      final response = await post('$urlApi/user', {
        'user_id': box.read("userData")["id"],
      }, headers: {
        'Authorization': "Bearer ${box.read("token")}"
      });

      var data = response.body;

      print("response $data");
      if (data != null) {
        if (data['user'] != null) {
          box.write("userData", data['user']);
          profileController.update();
          onLoadingDismiss();
        } else {
          errorMessage("Gagal mengambil data");
          onLoadingDismiss();
        }
      } else {
        errorMessage("Gagal mengambil data");
        onLoadingDismiss();
      }
    } catch (e) {
      errorMessage(e);
      onLoadingDismiss();
    }
  }

  void register(context) async {
    RegisterController registerController = Get.put(RegisterController());

    String name = registerController.nameController.text;
    String email = registerController.emailController.text;
    String password = registerController.passwordController.text;

    if (name != '' && email != '' && password != '') {
      showLoading();

      try {
        final response = await post('$urlApi/auth/register',
            {'email': email, 'password': password, 'name': name});

        var data = response.body;

        print("response $data");
        if (data != null) {
          if (data['message'] == 'User Created Successfully') {
            onLoadingDismiss();
            Get.back();
            successMessage(context, data['message']);
          } else {
            onLoadingDismiss();
            errorMessage(data['message']);
          }
        } else {
          onLoadingDismiss();
          errorMessage("Gagal Daftr");
        }
      } catch (e) {
        onLoadingDismiss();
        errorMessage(e);
      }
    } else {
      errorMessage("Lengkapi Data terlebih dahulu.");
    }
  }
}
