

import 'package:auto_route/auto_route.dart';
import 'package:demo_users/domain/usecases/set_has_showed_on_boarding_usecase.dart';
import 'package:demo_users/framework/locator/inject_container.dart';
import 'package:demo_users/framework/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

@RoutePage()
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoardingPage> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      const ContentConfig(
        title: "Title 1",
        styleTitle: TextStyle(
          color: Colors.black
        ),
        description: "This is intro 1",
        styleDescription: TextStyle(
          color: Colors.black
        ),
        pathImage: "assets/icons/one.png",
        backgroundColor: Colors.white,
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "Title 2",
        styleTitle: TextStyle(
            color: Colors.black
        ),
        description: "This is intro 2",
        styleDescription: TextStyle(
            color: Colors.black
        ),
        pathImage: "assets/icons/two.png",
        backgroundColor: Colors.white,
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "Title 3",
        styleTitle: TextStyle(
            color: Colors.black
        ),
        description: "This is intro 3",
        styleDescription: TextStyle(
            color: Colors.black
        ),
        pathImage: "assets/icons/three.png",
        backgroundColor: Colors.white,
      ),
    );
  }

  void onDonePress() {
    final setHasShowedOnBoardingUseCase = locator<SetHasShowedOnBoardingUseCase>();
    setHasShowedOnBoardingUseCase.call(true).then((value) {
      context.router.replace(const ListRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      listContentConfig: listContentConfig,
      onDonePress: onDonePress,
    );
  }
}
