import 'package:expense_manager/widgets/app_bar.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  static const String routeName = '/wallet';
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/pageHeader.png"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              ExAppBar(
                title: "Add Wallet",
                color: Colors.white,
                trailing: FeatherIcons.moreHorizontal,
                trailingOnTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
