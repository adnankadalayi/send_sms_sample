import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:send_sms_sample/controllers/home_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send SMS'),
        backgroundColor: Colors.red.shade50,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (homeController.selectedContacts.isEmpty)
              const Center(
                child: Text('No Contacts Selected!'),
              ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              // height: Get.height * 0.2,
              child: ListView.builder(
                itemCount: homeController.selectedContacts.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                    ),
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.blue[800],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                ),
                labelText: 'Search...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            if (homeController.contactList.isEmpty)
              const Text('No Contacts Found!'),
            Expanded(
              child: ListView.builder(
                itemCount: homeController.contactList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 40,
                      ),
                    ),
                    title: const Text('Adnan'),
                    subtitle: const Text('9497099873'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
