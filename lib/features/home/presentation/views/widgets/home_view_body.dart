import 'package:farmfix/features/home/presentation/views/widgets/home_card.dart';
import 'package:farmfix/features/home/presentation/views/widgets/welcome_message_and_profile_setting.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WelcomeMessageAndProfileSetting(),
        const Align(
          alignment: AlignmentDirectional.center,
<<<<<<< HEAD
          child: HomeCard(),
=======
          child: HomeCard(widget: Row()),
>>>>>>> 2178b46c36ea60340672e5dfbad2674dbb3f523f
        ),
      ],
    );
  }
}
