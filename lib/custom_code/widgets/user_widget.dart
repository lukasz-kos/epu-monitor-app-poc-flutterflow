// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
import 'package:auth0_flutter/auth0_flutter.dart';

class UserWidget extends StatelessWidget {
  final UserProfile? user;

  const UserWidget({required this.user, final Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pictureUrl = user?.pictureUrl;
    // id, name, email, email verified, updated_at
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (pictureUrl != null)
        Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: CircleAvatar(
              radius: 56,
              child: ClipOval(child: Image.network(pictureUrl.toString())),
            )),
      Card(
          child: Column(children: [
        UserEntryWidget(propertyName: 'Id', propertyValue: user?.sub),
        UserEntryWidget(propertyName: 'Name', propertyValue: user?.name),
        UserEntryWidget(propertyName: 'Email', propertyValue: user?.email),
        UserEntryWidget(
            propertyName: 'Email Verified?',
            propertyValue: user?.isEmailVerified.toString()),
        UserEntryWidget(
            propertyName: 'Updated at',
            propertyValue: user?.updatedAt?.toIso8601String()),
      ]))
    ]);
  }
}

class UserEntryWidget extends StatelessWidget {
  final String propertyName;
  final String? propertyValue;

  const UserEntryWidget(
      {required this.propertyName, required this.propertyValue, final Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(propertyName), Text(propertyValue ?? '')],
        ));
  }
}
