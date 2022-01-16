import 'package:flutter/material.dart';
import 'package:scratch_012022/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => SubRoutes.key.currentState!.pushNamed(
            HomeSubRoutes.detail,
          ),
          child: const Text('Detail'),
        ),
      ),
    );
  }
}
