import 'package:flutter/material.dart';
import 'package:meddeliver/utils/constant_images.dart';
import 'package:meddeliver/utils/custom_text_style.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xff00FB83),
              Colors.green[100]!,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            welcomeText(),
            appointmentsWidget(),
          ],
        ),
      ),
    );
  }

  Widget circleAvatarWidget() => CircleAvatar(
        child: Image.network(ConstantImages.getInstance().profilePictureHint),
      );

  AppBar customAppBar() => AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff00FB83),
        leading: const Icon(Icons.calendar_today_outlined),
        actions: [
          circleAvatarWidget(),
        ],
      );

  Widget welcomeText() => const Padding(
        padding: EdgeInsets.all(32),
        child: Text(
          "Good \nAfternoon, \nYusuf !",
          style: TextStyle(fontSize: 32),
        ),
      );

  Widget appointmentDetailWidget(String title, String subtitle) => Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xffB7F8FC),
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(32)),
          ),
          child: Row(
            children: [
              circleAvatarWidget(),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.black)),
                  Text(subtitle, style: const TextStyle(color: Colors.black)),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more),
            ],
          ),
        ),
      );

  Widget appointmentsWidget() => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 32,
        ),
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recent appointments",
                style: CustomTextStyle.getInstance().bigTitle,
              ),
              appointmentDetailWidget("Did not come to \nthe appointment", ""),
              appointmentDetailWidget(
                  "Prescription number: 523895", "Date: 19.03.2023"),
            ],
          ),
        ),
      );
}
