import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sntr_banking_management_agent_end/view/screen/pending_account_details_screen.dart';

class PendingAccountsScreen extends StatefulWidget {
  const PendingAccountsScreen({super.key});

  @override
  State<PendingAccountsScreen> createState() => _PendingAccountsScreenState();
}

class _PendingAccountsScreenState extends State<PendingAccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Image.asset(
          "assets/icons/pending_accounts.png",
          height: 40,
          width: 40,
        ),
        title: const Text("Pending Accounts"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => PendingAccountDetailsScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: CircleAvatar(
                          radius: 40,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: "fhfhfhfhf",
                              placeholder: (context, url) => const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Account ID: asdasdasd",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            "Name: Jack Roberto",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      const Row(
                        children: [
                          Text(
                            "Show Details",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 12),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
