// ignore_for_file: camel_case_types, unrelated_type_equality_checks, use_build_context_synchronously, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goodiemap_app/models/models.dart';
import 'package:goodiemap_app/provider/theme_provider.dart';
import 'package:goodiemap_app/screens/screens.dart';
import 'package:goodiemap_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

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
    const homePage(),
    const MapScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const homePage();
  int activeIndex = 0;
  DateTime? currentBackPressTime;
  final urlimage = [
    'https://d5anwn521ljmo.cloudfront.net/mageplaza/bannerslider/banner/image/m/a/main_snackshack_986x384.jpg',
    'https://d5anwn521ljmo.cloudfront.net/mageplaza/bannerslider/banner/image/m/a/main_skinlove_986x384.jpg',
    'https://d5anwn521ljmo.cloudfront.net/mageplaza/bannerslider/banner/image/m/a/main_elevateyourkitchen_986x384.jpg',
    'https://d5anwn521ljmo.cloudfront.net/mageplaza/bannerslider/banner/image/m/a/main_flavor_spice_986x384.jpg'
  ];

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
      debugPrint(barcodeScanRes);

      // Check if the scanned barcode matches any product
      Product? scannedProduct;
      try {
        scannedProduct = Product.products.firstWhere(
          (product) => product.barcode == barcodeScanRes,
        );
      } catch (e) {
        scannedProduct = null;
      }

      if (scannedProduct != null) {
        // If match found, navigate to the product screen
        Navigator.push(
          context,
          productScreen.route(product: scannedProduct),
        );
      } else {
        // If no match found, display a Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  height: 95,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 48),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Oh snap!',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'No product registered with barcode $barcodeScanRes',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 10,
                  child: SvgPicture.asset("assets/error.svg",
                      height: 48, width: 40),
                ),
              ],
            ),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        );
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool isProfilePage = currentScreen is ProfileScreen;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) >
                const Duration(seconds: 2)) {
          currentBackPressTime = now;
          showExitSnackBar(context);
          return false;
        }

        // If on the home page, exit the app
        if (currentScreen is homePage) {
          SystemNavigator.pop();
        } else {
          // If on another page, pop the current route
          Navigator.pop(context);
        }

        return false; // Prevent the default back button behavior
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: themeProvider.isDarkMode
            ? Colors.grey.shade900 // Set the text color for dark mode
            : Colors.white, // Set the text color for light mode,
        appBar: isProfilePage ? null : const CustomAppBar(),
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
                              const SizedBox(height: 120),
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
                                padding:
                                    const EdgeInsets.only(top: 3, bottom: 5),
                                child: buildIndicator(),
                              ),
                              Divider(
                                color: themeProvider.isDarkMode
                                    ? Colors
                                        .white // Set the text color for dark mode
                                    : Colors
                                        .black26, // Set the text color for light mode,
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
                  bucket: bucket,
                  child: currentScreen,
                ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            scanBarcodeNormal();
          },
          backgroundColor: const Color.fromARGB(255, 1, 95, 43),
          shape: const CircleBorder(),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.qr_code,
                color: Colors.white,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          notchMargin: 10,
          shape: const CircularNotchedRectangle(),
          color: const Color(0xFF46B177),
          child: Container(
            decoration: const BoxDecoration(),
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
                          currentScreen = const homePage();
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
                          currentScreen = const FavoriteScreen();
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
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: const ExpandingDotsEffect(
            dotWidth: 8,
            dotHeight: 8,
            dotColor: Color.fromARGB(255, 202, 202, 202),
            activeDotColor: Color.fromARGB(179, 87, 87, 87)),
        activeIndex: activeIndex,
        count: urlimage.length,
      );

  Widget buildImage(String urlImage, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Image.network(urlImage, fit: BoxFit.fill),
      );

  void showExitSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Press back again to exit'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}
