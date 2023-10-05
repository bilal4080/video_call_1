import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

var appId = 258539672;
var appSign =
    'a983fe05c60860bfcf88203344d217ce2b81fbcff8ac595385757c4f2211ea4b';

final String localUserID = math.Random().nextInt(10000).toString();

class homme extends StatefulWidget {
  const homme({Key? key}) : super(key: key);

  @override
  State<homme> createState() => _HomePageState();
}

class _HomePageState extends State<homme> {
  TextEditingController callIDTextCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                controller: callIDTextCtrl,
                decoration:
                    const InputDecoration(labelText: "join a call by id"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return CallPage(callID: callIDTextCtrl.text);
                  }),
                );
              },
              child: const Text("join"),
            )
          ],
        ),
      ),
    );
  }
}

class CallPage extends StatelessWidget {
  final String callID;

  const CallPage({
    Key? key,
    required this.callID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: appId,
        appSign: appSign,
        userID: localUserID,
        userName: "user_$localUserID",
        callID: callID,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..onOnlySelfInRoom = (context) {
            Navigator.of(context).pop();
          },
      ),
    );
  }
}
