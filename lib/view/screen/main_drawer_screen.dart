import 'package:flutter/material.dart';
import 'package:sntr_banking_management_agent_end/view/screen/deposit_screen.dart';
import 'package:sntr_banking_management_agent_end/view/screen/login_screen.dart';
import 'package:sntr_banking_management_agent_end/view/screen/pending_accounts_screen.dart';

class MainDrawerScreen extends StatefulWidget {
  const MainDrawerScreen({super.key});

  @override
  State<MainDrawerScreen> createState() => _MainDrawerScreenState();
}

class _MainDrawerScreenState extends State<MainDrawerScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SNTR Mobile Banking'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Available Services',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.green,
              ),
              title: const Text('Home'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/icons/deposit.png",
                height: 25,
                width: 25,
              ),
              title: const Text('Deposit'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/icons/pending_accounts.png",
                height: 25,
                width: 25,
              ),
              title: const Text('Pending Accounts'),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _getSelectedScreen(),
      ),
    );
  }

  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return const Text(
          'Welcome, Agent Panel Of The SNTR Mobile Banking Limited',
          style: TextStyle(
            fontSize: 32,
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        );
      case 1:
        return const DepositScreen();
      case 2:
        return const PendingAccountsScreen();
      default:
        return const Text('Nothing!!');
    }
  }
}
