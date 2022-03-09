import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:gyl/models/onboarding_info.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex =
      0.obs; //here we define the observable variable as RxInt
  var pageController = PageController(); //native
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;

  nextPage() {
    if (isLastPage)
      pageController.animateToPage(pageController.initialPage, duration: 300.milliseconds, curve: Curves.ease); //send back to first page
    else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/order.png', 'Order Your Food',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore'),
    OnboardingInfo('assets/cook.png', 'Cook Your Food',
        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium'),
    OnboardingInfo('assets/deliver.png', 'Deliver Your Food',
        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.')
  ];
}
