import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gyl/controllers/onboardingController.dart';

class OnboardingPage extends StatelessWidget {
  final _controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            _controller.onboardingPages[index].imageAsset),
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          _controller.onboardingPages[index].title,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64.0),
                          child: Text(
                            _controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: List.generate(
                    _controller.onboardingPages.length,
                    (index) => Obx(() {//register for changes, so listeners can observe
                          return Container(
                            margin: EdgeInsets.all(4),
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  _controller.selectedPageIndex.value == index
                                      ? Colors.red
                                      : Colors.grey,
                            ),
                          );
                        })),
              ),
            ),
            Positioned(
                right: 20,
                bottom: 20,
                child: FloatingActionButton(
                  elevation: 0,
                  onPressed: _controller.nextPage,
                  child: Obx(() {
                    return Text(_controller.isLastPage ? 'Start' : 'Next');
                  }),
                )),
          ],
        ),
      ),
    );
  }
}
