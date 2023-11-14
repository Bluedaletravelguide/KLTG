// ignore_for_file: constant_identifier_names

import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kltheguide/blog_page.dart';
import 'package:kltheguide/bookmarks_page.dart';
import 'package:kltheguide/contact_us.dart';
import 'package:kltheguide/ebook_page.dart';
import 'package:kltheguide/explorekl.dart';
import 'package:kltheguide/shop.dart';
import 'package:kltheguide/spa.dart';
import 'package:kltheguide/stay.dart';
import 'package:kltheguide/beyondkl.dart';
import 'package:kltheguide/medicaltourism.dart';
import 'package:kltheguide/highlights.dart';
import 'package:kltheguide/home_page.dart';
import 'package:kltheguide/about_us.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
  // Check the app version and build number

  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KL The Guide',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.

        // primarySwatch: const Colors(0xFF343484),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 71, 133)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
      routes: {
        '/highlights-0': (context) => GlancePage(),
        '/highlights-1': (context) => const GetAround2(),
        '/highlights-2': (context) => const TravelTips2(),
        '/rmd-0': (context) => ExploreKL(),
        '/explorekl-0': (context) => const ExploreKL_WTD(),
        '/explorekl-1': (context) => const ExploreKL_HS(),
        '/explorekl-2': (context) => const ExploreKL_PWOR(),
        '/explorekl-3': (context) => const ExploreKL_WTE(),
        '/explorekl-4': (context) => const ExploreKL_NL(),
        '/explorekl-5': (context) => const ExploreKL_KL4K(),
        '/explorekl-6': (context) => const ExploreKL_SS(),
        '/explorekl-7': (context) => const ExploreKL_P(),
        '/rmd-1': (context) => const Shop(),
        '/rmd-2': (context) => const Stay(),
        '/rmd-3': (context) => const Spa(),
        '/rmd-4': (context) => const MedicalT(),
        '/rmd-5': (context) => BeyondKL(),
        '/beyondkl-0': (context) => const BeyondKL_I(),
        '/beyondkl-1': (context) => const BeyondKL_HS(),
        '/beyondkl-2': (context) => const BeyondKL_W(),
        '/beyondkl-3': (context) => const BeyondKL_H(),
        '/beyondkl-4': (context) => const BeyondKL_ES(),
        '/ebook-0': (context) =>
            const Ebook_view(category: 'kltg', name: 'KL The Guide'),
        '/ebook-1': (context) =>
            const Ebook_view(category: 'kv4l', name: 'Klang Valley 4 Locals'),
        '/ebook-2': (context) =>
            const Ebook_view(category: 'mktg', name: 'Melaka The Guide'),
        '/ebook-3': (context) =>
            const Ebook_view(category: 'tptg', name: 'Taiping The Guide'),
        '/ebook-4': (context) =>
            const Ebook_view(category: 'uztg', name: 'Uzbekistan The Guide'),
        '/ebook-5': (context) =>
            const Ebook_view(category: 'kntg', name: 'Keningau The Guide'),
        '/ebook-6': (context) =>
            const Ebook_view(category: 'twtg', name: 'Tawau The Guide'),
        '/ebook-7': (context) =>
            const Ebook_view(category: 'tbtg', name: 'Tambunan The Guide'),
        '/ebook-8': (context) =>
            const Ebook_view(category: 'hstg', name: 'Hulu Selangor The Guide'),
        '/ebook-9': (context) =>
            const Ebook_view(category: 'prtg', name: 'Perak The Guide'),
        '/ebook-10': (context) =>
            const Ebook_view(category: 'sbtg', name: 'Seremban The Guide'),
        '/ebook-11': (context) => const Ebook_view(
            category: 'kstg', name: 'Kuala Selangor The Guide'),
        '/ebook-12': (context) =>
            const Ebook_view(category: 'klgt', name: 'Kuala Langat The Guide'),
        '/ebook-13': (context) =>
            const Ebook_view(category: 'kztg', name: 'Kazakhstan The Guide'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int currentPageIndex = 0;
  final String desiredVersion = '1.5.0'; // Replace with your desired version

  late BannerAd _bannerAd;
  DateTime? currentBackPressTime;

  bool isDialogShown = false; // Add a flag to track if the dialog is shown

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Create a BannerAd instance
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-7002644831588730/4427349537',
      size: AdSize.mediumRectangle,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    );

    // Load the ad
    _bannerAd.load();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Use addPostFrameCallback to ensure the dialog is shown after the first frame

      _checkVersionAndShowDialog();
      if (!isDialogShown) {
        fetchDataFromApi();
      }
    });
  }

  Future<void> _checkVersionAndShowDialog() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;
    final currentBuildNumber = packageInfo.buildNumber;

    // Define your desired version and build
    final desiredVersionAndBuild = await _fetchDesiredVersionAndBuild();
    final String desiredVersion = desiredVersionAndBuild['version']!;
    final String desiredBuildNumber = desiredVersionAndBuild['buildNumber']!;

    if (_isUpdateRequired(currentVersion, desiredVersion, currentBuildNumber,
        desiredBuildNumber)) {
      // Versions do not match, show AlertDialog
      _showUpdateDialog(context);
    }
  }

  Future<Map<String, String>> _fetchDesiredVersionAndBuild() async {
    final response = await http.post(
      Uri.parse(
          'https://www.kltheguide.com.my/admin/functions.php'), // Replace with your API endpoint
      body: {'appAdsSettings': 'appAdsSettings'},
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);

      return {
        'version': jsonData['desiredVersion'],
        'buildNumber': jsonData['desiredBuildNumber'],
      };
    } else {
      throw Exception('Failed to fetch desired version and build number');
    }
  }

  bool _isUpdateRequired(String currentVersion, String desiredVersion,
      String currentBuildNumber, String desiredBuildNumber) {
    List<int> currentVersionParts =
        currentVersion.split('.').map(int.parse).toList();
    List<int> desiredVersionParts =
        desiredVersion.split('.').map(int.parse).toList();

    for (int i = 0; i < currentVersionParts.length; i++) {
      if (currentVersionParts[i] < desiredVersionParts[i]) {
        return true;
      } else if (currentVersionParts[i] > desiredVersionParts[i]) {
        return false;
      }
    }

    // If versions are equal, check build numbers
    return int.parse(currentBuildNumber) < int.parse(desiredBuildNumber);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      currentBackPressTime = null; // Reset the back button press time
    }
  }

  void _showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Required'),
          content: Text(
            'A new version of the app is available. Please update to enjoy new features of the app.',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // You can navigate to the store or perform update logic here
              },
              child: Text('Update Later'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _launchURL(
                    'https://play.google.com/store/apps/details?id=my.com.kltheguide&hl=en&gl=US');
                // You can navigate to the store or perform update logic here
              },
              child: Text('Update Now'),
            ),
          ],
        );
      },
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Welcome'),
          content: Text('This is an example AlertDialog on app launch.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<bool> _onWillPop() async {
    final now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Press back again to exit'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return false;
    }
    return true;
  }

  Future<List<ImageData>> fetchImageUrls() async {
    try {
      final response = await http.post(
        Uri.parse('https://www.kltheguide.com.my/admin/functions.php'),
        body: {'appAdsURL': 'appAdsURL'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final List<ImageData> imageUrls = jsonData.map((item) {
          return ImageData(
            imageUrl: item['imageURL'] as String,
            actionUrl: item['URL'] as String,
          );
        }).toList();

        return imageUrls;
      } else {
        throw Exception('Failed to load image URLs from the API');
      }
    } catch (e) {
      print('Error fetching image URLs: $e');
      return []; // Return an empty list in case of an error
    }
  }

  Future<void> fetchDataFromApi() async {
    try {
      final response = await http.post(
        Uri.parse('https://www.kltheguide.com.my/admin/functions.php'),
        body: {'appAdsSettings': 'appAdsSettings'},
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        var range = jsonData['range'];
        var start = jsonData['start'];
        var admobrandomswitch = jsonData['admobrandomswitch'];
        print(isDialogShown);

        print(range);
        print(start);
        print(admobrandomswitch);
        int? switch2 = int.parse(admobrandomswitch);

        final Random random = Random();

        if (switch2 == 1) {
          var testrando = random.nextInt(5);
          print(testrando);
          print('switdch 1');

          if (testrando == 1) {
            int? rangeval;
            int? startval;

            try {
              rangeval = int.parse(range);
              startval = int.parse(start);
            } catch (e) {
              print('Error parsing integers: $e');
            }

            if (rangeval != null && startval != null) {
              int delayInSeconds = random.nextInt(rangeval) + startval;
              print('Delay: $delayInSeconds seconds');
              if (isDialogShown) {
                _showWelcomeDialog(delayInSeconds);
              } else {
                _showWelcomeDialog(0);
                isDialogShown = true;
              }
            } else {
              print('Invalid integer values received from the API.');
            }
          } else {
            int? rangeval;
            int? startval;

            try {
              rangeval = int.parse(range);
              startval = int.parse(start);
            } catch (e) {
              print('Error parsing integers: $e');
            }

            if (rangeval != null && startval != null) {
              int delayInSeconds = random.nextInt(rangeval) + startval;
              print('Delay: $delayInSeconds seconds');

              final List<ImageData> imageDatas = await fetchImageUrls();
              if (imageDatas.isNotEmpty) {
                final randomImageData =
                    imageDatas[random.nextInt(imageDatas.length)];
                if (isDialogShown) {
                  _showRandomPopup(delayInSeconds, randomImageData);
                } else {
                  _showRandomPopup(0, randomImageData);
                  isDialogShown = true;
                }
              }
            } else {
              print('Invalid integer values received from the API.');
            }
          }
        } else if (switch2 == 2) {
          print('switdch 2');
          int? rangeval;
          int? startval;

          try {
            rangeval = int.parse(range);
            startval = int.parse(start);
          } catch (e) {
            print('Error parsing integers: $e');
          }

          if (rangeval != null && startval != null) {
            int delayInSeconds = random.nextInt(rangeval) + startval;
            print('Delay: $delayInSeconds seconds');
            if (isDialogShown) {
              _showWelcomeDialog(delayInSeconds);
            } else {
              _showWelcomeDialog(0);
              isDialogShown = true;
            }
          } else {
            print('Invalid integer values received from the API.');
          }
        } else {
          print('switdch 0');

          // Use error handling to parse integers
          int? rangeval;
          int? startval;

          try {
            rangeval = int.parse(range);
            startval = int.parse(start);
          } catch (e) {
            print('Error parsing integers: $e');
          }

          if (rangeval != null && startval != null) {
            int delayInSeconds = random.nextInt(rangeval) + startval;
            print('Delay: $delayInSeconds seconds');

            final List<ImageData> imageDatas = await fetchImageUrls();
            if (imageDatas.isNotEmpty) {
              final randomImageData =
                  imageDatas[random.nextInt(imageDatas.length)];
              if (isDialogShown) {
                _showRandomPopup(delayInSeconds, randomImageData);
              } else {
                _showRandomPopup(0, randomImageData);
                isDialogShown = true;
              }
            }
          } else {
            print('Invalid integer values received from the API.');
          }
        }
      } else {
        throw Exception('Failed to load data from the API');
      }
    } catch (e) {
      print('Error api : $e');
    }
  }

  void _showRandomPopup(int delayInSeconds, ImageData imageData) async {
    Future.delayed(Duration(seconds: delayInSeconds), () async {
      if (imageData != 'null') {
        final randomImageUrl = imageData.imageUrl;

        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return FutureBuilder<void>(
              future: Future.delayed(Duration(seconds: 0), () {}),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // While waiting for the delay, show a loading indicator
                  return Center(child: CircularProgressIndicator());
                } else {
                  // After the delay, display the image and actions
                  return WillPopScope(
                    onWillPop: () async {
                      return false;
                    },
                    child: AlertDialog(
                      shadowColor: Colors.transparent,
                      buttonPadding: EdgeInsets.zero,
                      contentPadding: EdgeInsets.zero,
                      actionsPadding: EdgeInsets.zero,
                      insetPadding: EdgeInsets.zero,
                      actionsAlignment: MainAxisAlignment.center,
                      // title: Text('Random Popup'),
                      backgroundColor: Colors.transparent,
                      content: GestureDetector(
                        child: Image.network(randomImageUrl),
                        onTap: () {
                          if (imageData.actionUrl.isNotEmpty) {
                            print(Uri.decodeFull(imageData.actionUrl));
                            _launchURL(Uri.decodeFull(imageData.actionUrl));
                          }
                        },
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                            fetchDataFromApi();
                          },
                          child: Icon(
                            Icons.cancel_outlined,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            );
          },
        );
      }
    });
  }

  void _showWelcomeDialog(int delaySec) {
    // Add a delay of 3 seconds before showing the dialog
    Future.delayed(Duration(seconds: delaySec), () {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: AlertDialog(
              buttonPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              actionsPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
              actionsAlignment: MainAxisAlignment.center,
              // title: Text('Random Popup'),
              backgroundColor: Colors.transparent,
              content: SizedBox(
                height: 250,
                width: 300,
                child: AdWidget(
                  ad: _bannerAd,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    fetchDataFromApi();
                  },
                  child: Icon(
                    Icons.cancel_outlined,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title:
              const Text("KL THE GUIDE", style: TextStyle(color: Colors.white)),
          // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          // indicatorColor: const Color.fromARGB(255, 0, 0, 0),
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
                selectedIcon:
                    Icon(Icons.home, color: Color.fromARGB(255, 0, 71, 133)),
                icon: Icon(Icons.home_outlined),
                label: 'Home'),
            NavigationDestination(
                selectedIcon: Icon(Icons.bookmark,
                    color: Color.fromARGB(255, 0, 71, 133)),
                icon: Icon(Icons.bookmark_border_outlined),
                label: 'Bookmarks'),
            NavigationDestination(
                selectedIcon:
                    Icon(Icons.article, color: Color.fromARGB(255, 0, 71, 133)),
                icon: Icon(Icons.article_outlined),
                label: 'Blog'),
            NavigationDestination(
                selectedIcon: Icon(Icons.menu_book,
                    color: Color.fromARGB(255, 0, 71, 133)),
                icon: Icon(Icons.menu_book_outlined),
                label: 'E-Book'),
          ],
        ),
        body: [
          HomeScreen(),
          BookmarkPage(),
          const BlogListScreen(),
          Ebook(),
        ][currentPageIndex],
      ),
    );
  }
}

class AppBarMore extends StatelessWidget {
  const AppBarMore({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      color: Colors.white,
      onSelected: (value) {
        // Handle the item selection here.
        if (value == 'Contact Us') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ContactUsPage(),
          ));
        } else if (value == 'About Us') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AboutUsPage(),
          ));
        }
        // Add more options for additional pages as needed.
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'About Us',
            child: Text('About Us'),
          ),
          const PopupMenuItem<String>(
            value: 'Contact Us',
            child: Text('Contact Us'),
          ),
          // Add more PopupMenuItem entries for additional pages.
        ];
      },
    );
  }
}

class MyFlutterApp {
  MyFlutterApp._();

  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;

  static const IconData instagram_1 =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  static const IconData whatsapp =
      IconData(0xf232, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

void _launchURL(url) async {
  var url2 = Uri.parse(url);
  if (await canLaunchUrl(url2)) {
    await launchUrl(url2, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

class ImageData {
  final String imageUrl;
  final String actionUrl;

  ImageData({
    required this.imageUrl,
    required this.actionUrl,
  });
}
