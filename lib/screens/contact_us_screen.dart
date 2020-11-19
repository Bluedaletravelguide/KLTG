import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ContactUsScreen extends StatefulWidget {
  static const routeName = '/contact';
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  List<String> attachments = [];
  bool isHTML = false;
  final body = FocusNode();
  final phone = FocusNode();

  final _recipientController = TextEditingController(
    text: 'enquiry@bluedale.com.my',
  );

  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _bodyController = TextEditingController();
  String _subject;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final form = GlobalKey<FormState>();
  Future<void> send() async {
    final validate = form.currentState.validate();
    if (!validate) {
      return;
    }

    final Email email = Email(
        body: 'Name: ' +
            _name.text +
            '\n' +
            'Contact: ' +
            _phone.text +
            '\n' +
            'Message: ' +
            _bodyController.text,
        subject: _subject,
        recipients: [_recipientController.text]);

    try {
      await FlutterEmailSender.send(email);
    } catch (error) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        elevation: 1000,
        behavior: SnackBarBehavior.floating,
        content: Text(
          error.toString(),
          textAlign: TextAlign.center,
        ),
      ));
    }
    _name.clear();
    _phone.clear();
    _bodyController.clear();
    _subject = '';

    if (!mounted) return;
  }

  void dispose() {
    body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: form,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: constraints.maxHeight * 0.15,
                          child: TextFormField(
                            controller: _name,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(phone);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter Valid Name!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: constraints.maxHeight * 0.15,
                          child: TextFormField(
                            focusNode: phone,
                            controller: _phone,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(body);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter Valid Phone Number!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Phone',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: constraints.maxHeight * 0.30,
                          child: DropDownFormField(
                            titleText: 'Subject',
                            hintText: 'Please choose one',
                            value: _subject,
                            onSaved: (value) {
                              setState(() {
                                _subject = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                _subject = value;
                              });
                            },
                            dataSource: [
                              {
                                "display": "Feedback",
                                "value": "Feedback",
                              },
                              {
                                "display": "Business Collaboration",
                                "value": "Business Collaboration",
                              },
                              {
                                "display": "Survey",
                                "value": "Survey",
                              },
                            ],
                            textField: 'display',
                            valueField: 'value',
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.20,
                          child: TextFormField(
                            controller: _bodyController,
                            focusNode: body,
                            maxLines: 8,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter Valid Message!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Message',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 4,
                          ),
                          child: PlatformButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              send();
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color.fromRGBO(255, 143, 0, 1),
                                    Color.fromRGBO(255, 143, 0, 0.5),
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.all(12),
                              alignment: Alignment.center,
                              child: Text(
                                'Submit',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ),
                        ),
                      ]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
