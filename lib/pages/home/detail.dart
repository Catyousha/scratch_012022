import 'package:flutter/material.dart';
import 'package:scratch_012022/routes/routes.dart';

class DetailSubpage extends StatelessWidget {
  const DetailSubpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail subpage'),
      ),
      body: const Center(
        child: Text('Detail.'),
      ),
    );
  }
}
