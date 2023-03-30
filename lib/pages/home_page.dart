import 'package:flutter/material.dart';

import '../utils/constant_images.dart';
import '../utils/context_extension.dart';
import '../utils/custom_padding.dart';
import '../utils/custom_text_style.dart';
import '../utils/strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            ConstantImages.getInstance().homePageBackgroundImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        children: [
          Expanded(flex: 1, child: customAppBar()),
          Expanded(flex: 3, child: welcomeText()),
          SizedBox(height: context.screenHeight * 0.10),
          ...appointmentsWidgets(),
        ],
      ),
    );
  }

  Widget circleAvatarWidget() => CircleAvatar(
        child: Image.network(ConstantImages.getInstance().profilePictureHint),
      );
  AppBar customAppBar() => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.calendar_month_outlined),
        actions: [
          circleAvatarWidget(),
        ],
      );

  Widget welcomeText() => Padding(
        padding: CustomPadding.getInstance().symmetricPadding(horizontal: 16),
        child: Text(
          "${Strings.welcomText}Yusuf !",
          style: CustomTextStyle.getInstance().welcomeTextStyle,
        ),
      );

  Widget appointmentDetailWidget(String title, String subtitle) => Padding(
        padding: CustomPadding.getInstance().mediumPadding,
        child: Container(
          padding: CustomPadding.getInstance().smallPadding,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(32)),
          ),
          child: Row(
            children: [
              circleAvatarWidget(),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(subtitle),
                ],
              ),
              const Spacer(),
              const Icon(Icons.text_snippet_outlined),
            ],
          ),
        ),
      );

  List<Widget> appointmentsWidgets() => [
        Padding(
          padding: CustomPadding.getInstance().smallPadding,
          child: Text(
            Strings.appointmentTitle,
            style: CustomTextStyle.getInstance().bigTitle,
          ),
        ),
        appointmentDetailWidget(
          "Date: 29.03.2023",
          "Prescription number: 525889",
        ),
        appointmentDetailWidget(
          "Did not come to the",
          "appointment",
        ),
        appointmentDetailWidget(
          "Date: 18.03.2023",
          "Prescription number: 425506",
        ),
        appointmentDetailWidget(
          "Date: 16.03.2023",
          "Prescription number: 625367",
        ),
        appointmentDetailWidget(
          "Date: 28.02.2023",
          "Prescription number: 523895",
        ),
      ];
}
