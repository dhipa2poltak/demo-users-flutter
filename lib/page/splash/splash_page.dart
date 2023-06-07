

import 'package:auto_route/auto_route.dart';
import 'package:demo_users/framework/locator/inject_container.dart';
import 'package:demo_users/framework/router/app_router.dart';
import 'package:flutter/material.dart';

import '../../app_config.dart';
import '../../common/app_constants.dart';
import '../../common/function/common_functions.dart';
import '../../domain/usecases/has_showed_on_boarding_usecase.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    enterFullScreen();

    Future.delayed(const Duration(seconds: AppConstants.DELAY_SPLASH)).then((value) {
      exitFullScreen();

      final hasShowedOnBoardingUseCase = locator<HasShowedOnBoardingUseCase>();
      hasShowedOnBoardingUseCase.call().then((value) {
        value.fold((appError) {

        }, (hasShowedOnBoarding) {
          if (hasShowedOnBoarding) {
            context.router.replace(const ListRoute());
          } else {
            context.router.replace(const OnBoardingRoute());
          }
        });
      });
    });

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  AppConfig.appName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36
                  ),
                ),
              ),
              Expanded(
                child: Image.asset(
                  'assets/icons/ic_launcher.png',
                  width: 200,
                  height: 200,
                )
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const CircularProgressIndicator(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                child: const Text(
                  "loading...",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
