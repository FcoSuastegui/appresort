import 'package:appresort/app/views/profile/components/profile_card.dart';
import 'package:appresort/app/views/profile/components/profile_content.dart';
import 'package:appresort/app/views/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileBody extends GetView<ProfileController> {
  const ProfileBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 10.0,
      ),
      child: Column(
        children: [
          ProfileCard(),
          Obx(
            () => controller.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ProfileContent(),
          ),
        ],
      ),
    );
  }
}
