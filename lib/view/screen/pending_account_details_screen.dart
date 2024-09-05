import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingAccountDetailsScreen extends StatefulWidget {
  const PendingAccountDetailsScreen({super.key, required this.userId});

  final String userId;

  @override
  State<PendingAccountDetailsScreen> createState() => _PendingAccountDetailsScreenState();
}

class _PendingAccountDetailsScreenState extends State<PendingAccountDetailsScreen> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pending Account Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  height: 190,
                  width: 290,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/icons/icon.png",
                      color: Colors.grey,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 190,
                  width: 290,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/icons/icon.png",
                      color: Colors.grey,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 190,
                  width: 290,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/icons/icon.png",
                      color: Colors.grey,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "First Name: Jack",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
                Text(
                  "Last Name: Alberto",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
                Text(
                  "Account User ID: Aldnsjkhfkjsfs",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
                Text(
                  "Email: jack@gmail.com",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
                Text(
                  "Phone: +0912312412312",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
                Text(
                  "NID No: 234234124214",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
                Text(
                  "Postal Code: 1620",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
                Text(
                  "Gender: Male",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
                Text(
                  "Address: Dhaka",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(width: 600),
                    SizedBox(
                      height: 40,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromWidth(double.maxFinite),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        child: const Text("Approve"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      height: 40,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: (){
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromWidth(double.maxFinite),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        child: const Text("Cancel"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
