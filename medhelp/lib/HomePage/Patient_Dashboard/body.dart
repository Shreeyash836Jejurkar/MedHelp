import 'package:flutter/material.dart';

import 'utility/useFeature.dart';

class dashboardBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 10,
        children: [
          useFeature("Explore NearBy", "assets/images/doctors.png",
              '/mapFeature'), //checkConsultant,
          useFeature("Share Medical Info", "assets/images/account.png",
              '/shareInfo'), // shareInfo,
          useFeature("ChatBot", "assets/images/bot.png", '/chatBot'), // chatbot
          useFeature("Setup Profile", "assets/images/setUp.png",
              '/setupProfile'), // profile setup
          useFeature(
              "More on Covid-19", "assets/images/cov19.png", '/covid19InfoIn'),
          useFeature("Community Forum", "assets/images/communityForum.png",
              '/communityForum'),
          //For Testing

          // useFeature("Testing feature", "", '/testing'),
        ],
      ),
    );
  }
}
