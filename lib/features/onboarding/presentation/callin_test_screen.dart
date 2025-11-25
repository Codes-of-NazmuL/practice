import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';

class CallinTestScreen extends StatefulWidget {
  const CallinTestScreen({super.key});

  @override
  State<CallinTestScreen> createState() => _CallinTestScreenState();
}

class _CallinTestScreenState extends State<CallinTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("call Test"),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          onTap: () async {
            print("call Make");
            CallKitParams para = const CallKitParams(
                android: AndroidParams(
                  backgroundColor: "#FFFFFF",
                  incomingCallNotificationChannelName: "Softvence",
                  isShowLogo: true,
                  textColor: "#0955fa",
                  actionColor: "#333333",
                  isCustomNotification: true,
                  missedCallNotificationChannelName: "Softvenve",
                ),
                id: "01735668",
                nameCaller: "Nazmul",
                handle: "121313",
                type: 1,
                missedCallNotification:
                    NotificationParams(callbackText: "bak kor"),
                appName: "Softvence",
                ios: IOSParams(handleType: "generic"),
                textAccept: "Dhorbi?",
                normalHandle: 1,
                extra: {
                  "userid": "sn13123123",
                },
                duration: 30000);

            await FlutterCallkitIncoming.showCallkitIncoming(para);
          },
          child: Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              child: Text("Make a Call"),
            ),
          ),
        ),
      ),
    );
  }
}
