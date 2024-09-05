import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sntr_banking_management_agent_end/controller/pending_accounts_controller.dart';
import 'package:sntr_banking_management_agent_end/view/screen/pending_account_details_screen.dart';

class PendingAccountsScreen extends StatefulWidget {
  const PendingAccountsScreen({super.key});

  @override
  State<PendingAccountsScreen> createState() => _PendingAccountsScreenState();
}

class _PendingAccountsScreenState extends State<PendingAccountsScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<PendingAccountsController>().pendingAccountDataController();
  }
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
      body: GetBuilder<PendingAccountsController>(
        builder: (pendingAccountsController) {
          if(pendingAccountsController.inProgress) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: pendingAccountsController.pendingAccountDataList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => PendingAccountDetailsScreen(userId: pendingAccountsController.pendingAccountDataList[index].userId!));
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
                                  imageUrl: pendingAccountsController.pendingAccountDataList[index].profilePicture ?? "",
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
                                "Account ID: ${pendingAccountsController.pendingAccountDataList[index].userId}",
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                "Name: ${pendingAccountsController.pendingAccountDataList[index].firstName} ${pendingAccountsController.pendingAccountDataList[index].lastName}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
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
          );
        }
      ),
    );
  }
}
