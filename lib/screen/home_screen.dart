import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class HomeScreen extends StatelessWidget {
  final User user;
  const HomeScreen({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You are logged in succesfully',
              style: TextStyle(color: Colors.lightBlue, fontSize: 32),
            ),
            Text('${user.phoneNumber}',style: const TextStyle(color: Colors.grey),)
          ],
        ));
  }
}
