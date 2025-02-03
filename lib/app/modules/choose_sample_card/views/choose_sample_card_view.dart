import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/choose_sample_card_controller.dart';

class ChooseSampleCardView extends GetView<ChooseSampleCardController> {
  const ChooseSampleCardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChooseSampleCardView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ChooseSampleCardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
