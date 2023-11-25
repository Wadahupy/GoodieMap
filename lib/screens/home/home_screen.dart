import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:goodiemap_app/screens/favorites/favorite_screen.dart';
import 'package:goodiemap_app/screens/screens.dart';
import 'package:goodiemap_app/widgets/custom_AppBar.dart';
import 'package:goodiemap_app/widgets/popular_products.dart';
import 'package:goodiemap_app/widgets/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key});

  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const homePage(),
    );
  }

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int currentTab = 0;

  final List<Widget> screens = [
    homePage(),
    MapScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = homePage();

  int activeIndex = 0;
  final urlimage = [
    'https://d5anwn521ljmo.cloudfront.net/mageplaza/bannerslider/banner/image/m/a/main_snackshack_986x384.jpg',
    'https://d5anwn521ljmo.cloudfront.net/mageplaza/bannerslider/banner/image/m/a/main_skinlove_986x384.jpg',
    'https://d5anwn521ljmo.cloudfront.net/mageplaza/bannerslider/banner/image/m/a/main_elevateyourkitchen_986x384.jpg',
    'https://d5anwn521ljmo.cloudfront.net/mageplaza/bannerslider/banner/image/m/a/main_flavor_spice_986x384.jpg'
    // 'https://puregold.com.ph/pub/media/WEB_BANNER_baygon_1.jpg',
    // 'https://puregold.com.ph/pub/media/Promo_Alert_Payday_Unli_Free_Delivery_Main_Web_Banner_15.jpg',
    // 'https://puregold.com.ph/pub/media/WEB_BANNER1_1.JPG',
    // 'https://puregold.com.ph/pub/media/WEB_BANNER_4.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    bool isProfilePage = currentScreen is ProfileScreen;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: isProfilePage ? null : CustomAppBar(),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen is homePage
            ? Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            SizedBox(height: 100),
                            CarouselSlider.builder(
                              itemCount: urlimage.length,
                              itemBuilder: (context, index, realIndex) {
                                final urlImage = urlimage[index];
                                return buildImage(urlImage, index);
                              },
                              options: CarouselOptions(
                                height: 150,
                                autoPlay: true,
                                viewportFraction: 1,
                                onPageChanged: (int index,
                                    CarouselPageChangedReason reason) {
                                  setState(() {
                                    activeIndex = index;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3, bottom: 5),
                              child: buildIndicator(),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            const PopularProduct(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : PageStorage(
                child: currentScreen,
                bucket: bucket,
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 1, 95, 43),
        child: const Icon(Icons.qr_code_scanner),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        notchMargin: 10,
        shape: const CircularNotchedRectangle(),
        color: const Color(0xFF46B177),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = homePage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0
                              ? const Color.fromARGB(255, 1, 66, 3)
                              : Colors.white,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0
                                ? const Color.fromARGB(255, 1, 66, 3)
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const MapScreen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.map,
                          color: currentTab == 1
                              ? const Color.fromARGB(255, 1, 66, 3)
                              : Colors.white,
                        ),
                        Text(
                          'Map',
                          style: TextStyle(
                            color: currentTab == 1
                                ? const Color.fromARGB(255, 1, 66, 3)
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = FavoriteScreen();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: currentTab == 3
                              ? const Color.fromARGB(255, 1, 66, 3)
                              : Colors.white,
                        ),
                        Text(
                          'Favorite',
                          style: TextStyle(
                            color: currentTab == 3
                                ? const Color.fromARGB(255, 1, 66, 3)
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const ProfileScreen();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 4
                              ? const Color.fromARGB(255, 1, 66, 3)
                              : Colors.white,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 4
                                ? const Color.fromARGB(255, 1, 66, 3)
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: const ExpandingDotsEffect(
            dotWidth: 8,
            dotHeight: 8,
            dotColor: Colors.grey,
            activeDotColor: Color.fromARGB(179, 15, 15, 15)),
        activeIndex: activeIndex,
        count: urlimage.length,
      );

  Widget buildImage(String urlImage, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Image.network(urlImage, fit: BoxFit.fill),
      );
}
