import 'package:flutter/material.dart';
import '../routes/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => SubRoutes.key.currentState!.pushReplacementNamed(
            SubRoutes.home,
          ),
          child: const Text('home'),
        ),
      ),
    );
  }
}
