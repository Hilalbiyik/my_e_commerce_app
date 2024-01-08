import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_e_commerce_app/constants/app_color.dart';
import 'package:my_e_commerce_app/view_model/on_boarding_view_model.dart';
import 'package:provider/provider.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _buildOnboardingContent(context),
                  Row(
                    children: [
                      ...List.generate(
                        demo_data.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: DotIndicator(
                            isActive: index == viewModel.selectedPageIndex,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ConstantsColor.purpleColor,
            ),
            child: FloatingActionButton(
              onPressed: () {
                if (viewModel.pageController != null &&
                    viewModel.pageIndex == demo_data.length - 1) {
                  // Son sayfadaysa, login ekranına yönlendir
                 viewModel.openLoginPage(context);
                } else if (viewModel.pageController != null) {
                  // Son sayfada değilse, bir sonraki sayfaya geç
                  viewModel.pageController!.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                  viewModel.updateSelectedPageIndex(viewModel.pageIndex + 1);
                }
              },
              child: Icon(Icons.arrow_right_alt,color: Colors.white,),
              backgroundColor: Color.fromARGB(0, 172, 46, 46),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      },
    );
  }
}

Widget _buildOnboardingContent(BuildContext context) {
  OnBoardingViewModel viewModel =
      Provider.of<OnBoardingViewModel>(context, listen: false);

  return Expanded(
    child: Container(
      child: PageView.builder(
        itemCount: demo_data.length,
        onPageChanged: (index) {
          viewModel.pageIndex = index;
          viewModel.updateSelectedPageIndex(index);
        },
        controller: viewModel.pageController,
        itemBuilder: (context, index) => OnBoardContent(
          image: demo_data[index].image,
          title: demo_data[index].title,
          subtitle: demo_data[index].subtitle,
        ),
      ),
    ),
  );
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingViewModel>(
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 5),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: isActive ? 16 : 8,
            width: 6,
            decoration: BoxDecoration(
              color: isActive
                  ? ConstantsColor.purpleColor
                  : ConstantsColor.purpleColor.withOpacity(0.4),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        );
      },
    );
  }
}

class Onboard {
  final String image, title, subtitle;

  Onboard({required this.image, required this.title, required this.subtitle});
}

final List<Onboard> demo_data = [
  Onboard(
      image: ConstantsAdress.onBoardingjson,
      title: "Stilinize Dokunan Trend Ürünler!",
      subtitle:
          "Stilinize Dokunan Trend Ürünler!"),
  Onboard(
      image:ConstantsAdress.onBoardingjson,
      title: "Kolay Alışveriş, Büyük Keyif!",
      subtitle:
          "Online alışverişin keyfini çıkarın! Binlerce ürün arasından seçim yapın, tek tıkla kapınıza getirelim. Alışveriş keyfini bizimle yaşayın!"),
  Onboard(
      image: ConstantsAdress.onBoardingjson,
      title: "Moda Tutkunları İçin Anı Yakalayın!",
      subtitle:
          "Her an yenilikleri keşfedin, favori ürünlerinizi anında edinin. Moda dünyasındaki en güncel trendleri sizinle buluşturuyoruz. Unutulmaz anlar için modaya adım atın!")
];

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Lottie.asset(
                image,
                height: 250,
                fit: BoxFit.cover,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ConstantsColor.purpleColor),
              ),
            ],
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w200),
          )
        ],
      ),
    );
  }
}
