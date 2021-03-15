import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../Data/SizeConfig.dart';
import 'package:url_launcher/url_launcher.dart';

class TravelTips extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String image;

  const TravelTips(this.id, this.title, this.description, this.image);

  Object textSpan(BuildContext context, String text) {
    return TextSpan(text: text);
  }

  Object textSpanNo(BuildContext context, String phoneno) {
    return TextSpan(
      text: phoneno,
      style: TextStyle(color: Colors.blue),
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final sizeConfigVirtical = SizeConfig.blockSizeVertical;
    final sizeConfigHorizontal = SizeConfig.blockSizeHorizontal;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Row(children: [
          Image.asset(
            image,
            height: sizeConfigVirtical * 15,
            width: sizeConfigHorizontal * 25,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: sizeConfigHorizontal * 4),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(bottom: 20, right: 5),
                  width: MediaQuery.of(context).size.width,
                  child: id != 'tt15'
                      ? Text(
                          description,
                          textAlign: TextAlign.justify,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: SizeConfig.safeBlockHorizontal * 3.5),
                        )
                      : RichText(
                          textAlign: TextAlign.justify,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 3.5),
                              children: <TextSpan>[
                                textSpan(context, 'Police/Ambulance:\n999 ('),
                                textSpanNo(context, '112'),
                                textSpan(context, ' from a mobile phone)\n'),
                                //-------------------//
                                textSpan(context,
                                    'Fire and Rescue Department (Bomba): \n994 ('),
                                textSpanNo(context, '112'),
                                textSpan(context, ' from a mobile phone)'),
                                //-------------------//
                                textSpan(context, '\nCivil Defence Tel: \n'),
                                textSpanNo(context, '991'),
                                //-------------------//
                                textSpan(
                                    context, '\nTourist Police Hotline Tel:\n'),
                                textSpanNo(context, '+60321496590'),
                              ]),
                        ),
                ),
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
