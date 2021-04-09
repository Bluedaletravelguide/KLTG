import 'package:flutter/material.dart';
import '../Data/transportation_data.dart';
import '../widgets/transportation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class TransportationScreen extends StatefulWidget {
  static const routeName = '/transportation_screen';
  final String appbartitle;
  final String id;

  const TransportationScreen({Key key, this.appbartitle, this.id})
      : super(key: key);

  @override
  _TransportationScreenState createState() => _TransportationScreenState();
}

class _TransportationScreenState extends State<TransportationScreen> {
  @override
  Widget build(BuildContext context) {
    final subCategoryTitle = widget.appbartitle;
    final pageBody = SafeArea(
      child: Material(
        child: GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: SingleChildScrollView(
              child: Column(
                children: TransportationData.map(
                  (con) => Transportation(
                    con.id,
                    con.title,
                    con.description,
                    con.tel,
                    con.image,
                  ),
                ).toList(),
              ),
            ),
          ),
        ),
      ),
    );
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(subCategoryTitle),
      ),
      body: pageBody,
    );
  }
}
