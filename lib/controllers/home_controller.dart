import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getContacts();
  }

  var contactList = [].obs;
  var selectedContacts = [].obs;

  void getContacts() async {
    if (await FlutterContacts.requestPermission()) {
      contactList.value = await FlutterContacts.getContacts();
    }
  }
}
