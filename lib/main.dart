import 'package:KlTheGuide/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Data/SizeConfig.dart';
import 'screens/tabs_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'assets/images/Logo_100x50.png',
        ),
        splashIconSize: 80,
        nextScreen: Loading(),
        splashTransition: SplashTransition.decoratedBoxTransition,
      ),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KL The Guide',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.deepPurple[700],
            canvasColor: Color.fromRGBO(255, 255, 255, 1),
            textTheme: ThemeData.light().textTheme.copyWith(
                  //Black
                  //Fees
                  //Location
                  //Tel
                  //WorkHour
                  //Ebook
                  //About Us
                  headline1: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                      fontFamily: 'RobotoCondensed-Bold',
                      fontWeight: FontWeight.w700,
                      color: Colors.black),

                  //White
                  //Descreption (content)
                  //medical_screen ()
                  headline2: TextStyle(
                    color: Colors.white,
                    fontFamily: 'RobotoCondensed-Light',
                    fontWeight: FontWeight.w300,
                    fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                  ),

                  headline3: TextStyle(
                    color: Colors.white,
                    fontFamily: 'RobotoCondensed-Light',
                    fontWeight: FontWeight.w300,
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                  ),
                  //White
                  //KLAtGlance
                  bodyText1: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                    color: Colors.white,
                    fontFamily: 'RobotoCondensed-Regular',
                  ),
                  //Black
                  //about_us (content)
                  //content_screen (content)
                  //medical_screen ()
                  bodyText2: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                    color: Colors.black,
                    fontFamily: 'RobotoCondensed-Regular',
                  ),
                  headline4: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                    color: Colors.black,
                    fontFamily: 'RobotoCondensed-Regular',
                  ),

                  //White
                  //Contact Us (Text Field)
                  subtitle1: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                      fontFamily: 'RobotoCondensed-Light',
                      fontWeight: FontWeight.w300,
                      color: Colors.black),

                  //Black
                  //categories (Descreption)
                  //sub_categories (Descreption)
                  subtitle2: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                    fontFamily: 'Raleway-Bold',
                    fontWeight: FontWeight.w700,
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                  ),

                  //White
                  //categories (Title)
                  //sub_categories (Title)
                  headline5: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                      fontFamily: 'RobotoCondensed-Regular',
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  headline6: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                      fontFamily: 'RobotoCondensed-Light',
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                )),
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabsScreen(),
        });
  }
}
