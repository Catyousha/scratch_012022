import 'package:flutter/material.dart';
import 'package:otp/otp.dart';
import '../routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Form(
            key: formKey,
            child: TextFormField(
              onSaved: (val) {
                var code = OTP.generateTOTPCodeString(
                  "J22U6B3WIWRRBTAV",
                  DateTime.now().millisecondsSinceEpoch,
                  algorithm: Algorithm.SHA1,
                  isGoogle: true,
                );
                print(code);
                print(val == code);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => formKey.currentState!.save(),
            child: Text('verify otp'),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => SubRoutes.key.currentState!.pushNamed(
                HomeSubRoutes.detail,
              ),
              child: const Text('Detail'),
            ),
          ),
        ],
      ),
    );
  }
}
