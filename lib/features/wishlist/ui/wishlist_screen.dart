import 'package:flutter/material.dart';

class WhishListScreen extends StatefulWidget {
  const WhishListScreen({super.key});

  @override
  State<WhishListScreen> createState() => _WhishListScreenState();
}

class _WhishListScreenState extends State<WhishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
      ),
    );
  }
}
