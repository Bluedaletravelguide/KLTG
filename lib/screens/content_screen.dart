// import 'package:KlTheGuide/models/InAds.dart';
// import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import '../Data/content_data.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/content/decrepitation_widget.dart';
import '../widgets/content/fees_widget.dart';
import '../widgets/content/tel_widget.dart';
import '../widgets/content/workHour_widget.dart';
import '../widgets/content/location_widget.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ContentScreen extends StatefulWidget {
  static const routeName = '/content_screen';
  final String appbartitle;
  final String id;
  final String image;

  const ContentScreen({Key key, this.appbartitle, this.id, this.image})
      : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {


//Ads Code: 



  // InterstitialAd _interstitialAd;

  // void initState() {
  //   super.initState();
  //   _interstitialAd?.dispose();
  //   _interstitialAd = InAdsense().createInterstitialAd()..load();

  // }
 


//The main widget 
  @override
  Widget build(BuildContext context) {
    final contentTitle = widget.appbartitle;
    final contentId = widget.id;
    final contentImage = widget.image;
    final selectcontent =
        ContentData.firstWhere((contents) => contents.id == contentId);

    final pageBody = SafeArea(
      child: Material(
        child: GestureDetector(
          onVerticalDragCancel: () {
          //  _interstitialAd?.show();
          },
          child: SingleChildScrollView(
            child: Column(children: [
              Stack(children: [
                Image.asset(
                  contentImage,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 0,
                  child: Decrepitation(
                    text: selectcontent.decrepitation,
                  ),
                ),
              ]),
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                child: Text(
                  selectcontent.content,
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 10),
              Fees(text: selectcontent.fees),
              Tel(text: selectcontent.phoneNo, phone: selectcontent.phoneNo),
              WorkHour(text: selectcontent.workhour),
              Location(
                  text: selectcontent.locationText,
                  location: selectcontent.locationUrl),
              SizedBox(height: 50),
            ]),
          ),
        ),
      ),
    );
    return PlatformScaffold(
      appBar: PlatformAppBar(title: Text(contentTitle)),
      body: pageBody,
    );
  }
}
