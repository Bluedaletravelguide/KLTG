import 'package:flutter/material.dart';

class WorkHour extends StatelessWidget {
  final String text;
  const WorkHour({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  text != '-'
        ? Container(
           padding: EdgeInsets.only(bottom: 5),
          child: ListTile(
              leading: Icon(
                Icons.access_time,
                color: Colors.red,
                 size: MediaQuery.of(context).size.height*0.04,
              ),
              title: Text(
                'Opening Hours',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.start,
              ),
              subtitle: Text(
                text,
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.justify,
              ),
            ),
        )
        : SizedBox();
  }
}
