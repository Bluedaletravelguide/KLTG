// This imports used to call a library, screen path or class path.

import 'dart:ui';
import 'package:KlTheGuide/Data/SizeConfig.dart';
import 'package:KlTheGuide/Data/about_us.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class AboutUsScreen extends StatelessWidget {
  static const routeName = '/about';
  final CarouselController buttonCarouselController = CarouselController();
//We save the widget into a variable to prevenr code duplicating
// Widget variable
  Object textSpan(BuildContext context, String text) {
    return TextSpan(
      text: text,
      style: TextStyle(
        color: Colors.black,
      ),
    );
  }

// Widget variable
  Object textSpanNo(BuildContext context, String phoneno) {
    return TextSpan(
      text: phoneno,
      style: TextStyle(
        color: Colors.blue,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () async {
          String phone = "tel:" + phoneno;
          if (await canLaunch(phone)) {
            await launch(phone);
          } else {
            throw 'Could not launch $phone';
          }
        },
    );
  }

// Widget variable
  Widget clientButton(BuildContext context, String image, String clientUrl) {
    SizeConfig().init(context);
    return InkWell(
      splashColor: Colors.blueGrey[600],
      onTap: () async {
        final url = clientUrl;
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Image.asset(image,
              fit: BoxFit.fill,
              height: double.infinity,
              width: SizeConfig.blockSizeVertical * 23)),
    );
  }

// Widget variable
  Widget contentText(BuildContext context, String text, TextStyle style) {
    return Container(
      alignment: Alignment.center,
      child: Text(text, style: style, textAlign: TextAlign.justify),
    );
  }

// Widget variable
  Widget textBorder(BuildContext context, Widget child) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black45),
          borderRadius: BorderRadius.circular(12)),
      child: child,
    );
  }

// Widget variable
  Widget socialMedia(BuildContext context, String url, Icon icon, Color color) {
    return IconButton(
      onPressed: () async {
        url = url;
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      icon: icon,
      iconSize: SizeConfig.blockSizeVertical * 4,
      color: color,
    );
  }

//The Main Widget
  @override
  Widget build(BuildContext context) {
    final carsoulData = ClientCarsoulData;
    final socialData = SocialMediaData;
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/aboutUs.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.33), BlendMode.dstATop)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: constraints.maxHeight * 0.06,
                            //here we call the widget
                            child: contentText(
                              context,
                              'Our Story',
                              Theme.of(context).textTheme.headline1,
                            )),
                        Container(
                            height: constraints.maxHeight * 0.34,
                            child: textBorder(
                                context,
                                contentText(
                                  context,
                                  'KL The Guide is a quarterly guidebook, first published in August 2007. We are a free travel guide book that helps travellers make their travel plans around Malaysia\'s capital city, Kuala Lumpur. KL The Guide includes travel tips, places to explore, kid-friendly locations, hotels, transportation services, places to eat, sight-seeing, shopping places, nightlife and other things to do. With KL The Guide, navigating the city becomes easier.',
                                  MediaQuery.of(context).size.width > 500
                                      ? Theme.of(context).textTheme.headline4
                                      : Theme.of(context).textTheme.bodyText2,
                                ))),
                        Container(
                            height: constraints.maxHeight * 0.06,
                            child: contentText(
                              context,
                              'Find Us',
                              Theme.of(context).textTheme.headline1,
                            )),
                        Container(
                          height: constraints.maxHeight * 0.34,
                          child: textBorder(
                            context,
                            LayoutBuilder(
                              builder: (context, constraints) {
                                return Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: constraints.maxHeight * 0.3,
                                        child: InkWell(
                                            onTap: () async {
                                              const url =
                                                  'https://goo.gl/maps/TMu5YuBTU54epbmu6';
                                              if (await canLaunch(url)) {
                                                await launch(url);
                                              } else {
                                                throw 'Could not launch $url';
                                              }
                                            },
                                            child: contentText(
                                              context,
                                              'No.31-2, Block F2, Level 2, Jalan PJU 1/42a, Dataran Prima, 47301 Petaling Jaya, Selangor. \nOpening Hours: Monday-Friday: 9:00AM - 6:00PM',
                                              MediaQuery.of(context)
                                                          .size
                                                          .width >
                                                      500
                                                  ? Theme.of(context)
                                                      .textTheme
                                                      .headline4
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .bodyText2,
                                            )),
                                      ),
                                      //Divider(),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          height: constraints.maxHeight * 0.4,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            softWrap: true,
                                            overflow: TextOverflow.fade,
                                            text: TextSpan(
                                              style: TextStyle(
                                                  fontSize: SizeConfig
                                                          .safeBlockHorizontal *
                                                      3.4),
                                              children: <TextSpan>[
                                                textSpan(context, '\n'),
                                                textSpan(
                                                    context, 'Mobile no: '),
                                                textSpanNo(
                                                    context, '+6012-2200622'),
                                                textSpan(context, '\nTel No: '),
                                                textSpanNo(
                                                    context, '+603-78869219'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: constraints.maxHeight * 0.1,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemCount: socialData.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                //here we call the widget
                                                return socialMedia(
                                                  context,
                                                  socialData[index].url,
                                                  socialData[index].icon,
                                                  socialData[index].color,
                                                );
                                              }),
                                        ),
                                      ),
                                    ]);
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.2,
                          child: Stack(alignment: Alignment.center, children: [
                            CarouselSlider.builder(
                                carouselController: buttonCarouselController,
                                options: CarouselOptions(
                                  height: 150,
                                  enlargeCenterPage: true,
                                  autoPlay: true,
                                  aspectRatio: 16 / 9,
                                  autoPlayCurve: Curves.linearToEaseOut,
                                  enableInfiniteScroll: true,
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 1000),
                                  viewportFraction: 0.8,
                                ),
                                itemCount: ClientCarsoulData.length,
                                itemBuilder: (context, index) {
                                  return clientButton(
                                    context,
                                    carsoulData[index].image,
                                    carsoulData[index].url,
                                  );
                                }),
                            Positioned(
                              left: 0,
                              height: 150,
                              child: IconButton(
                                onPressed: () =>
                                    buttonCarouselController.previousPage(
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.linear),
                                icon: Icon(Icons.arrow_back_ios),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              height: 150,
                              child: IconButton(
                                onPressed: () =>
                                    buttonCarouselController.nextPage(
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.linear),
                                icon: Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ]),
                        ),
                      ]);
                },
              ),
            )));
  }
}
