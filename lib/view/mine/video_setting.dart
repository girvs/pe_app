import 'package:flutter/material.dart';
import 'package:pe_app/view/addressbook/my_friend_list.dart';

class VideoSettingPage extends StatefulWidget {
  @override
  _VideoSettingPageState createState() => _VideoSettingPageState();
}

class _VideoSettingPageState extends State<VideoSettingPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: MyFriendListPage(),
        )
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_webrtc/webrtc.dart';

// class VideoSettingPage extends StatefulWidget {
//   @override
//   _VideoSettingPageState createState() => _VideoSettingPageState();
// }

// class _VideoSettingPageState extends State<VideoSettingPage> {
//   MediaStream _localStream;
//   final _localRenderer = new RTCVideoRenderer();
//   bool _inCalling = false;

//   @override
//   initState() {
//     super.initState();
//     initRenderers();
//     _makeCall();
//   }

//   @override
//   deactivate() {
//     super.deactivate();
//     if (_inCalling) {
//       _hangUp();
//     }
//     _localRenderer.dispose();
//   }

//   initRenderers() async {
//     await _localRenderer.initialize();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   _makeCall() async {
//     final Map<String, dynamic> mediaConstraints = {
//       "audio": true,
//       "video": {
//         "mandatory": {
//           "minWidth":
//               '640', // Provide your own width, height and frame rate here
//           "minHeight": '480',
//           "minFrameRate": '30',
//         },
//         "facingMode": "user",
//         "optional": [],
//       }
//     };

//     try {
//       navigator.getUserMedia(mediaConstraints).then((stream) {
//         _localStream = stream;
//         _localRenderer.srcObject = _localStream;
//       });
//     } catch (e) {
//       print(e.toString());
//     }
//     if (!mounted) return;

//     setState(() {
//       _inCalling = true;
//     });
//   }

//   _hangUp() async {
//     try {
//       await _localStream.dispose();
//       _localRenderer.srcObject = null;
//     } catch (e) {
//       print(e.toString());
//     }
//     setState(() {
//       _inCalling = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var isDark = Theme.of(context).brightness == Brightness.dark;
//     var selectColor = isDark ? Colors.white : Colors.yellow[900];
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height - 120,
//         child: RTCVideoView(_localRenderer),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.transparent,
//         child: Container(
//           //color: isDark ? Theme.of(context).primaryColor : selectColor,
//           width: MediaQuery.of(context).size.width,
//           alignment: Alignment(0, 0),
//           height: 120,
//           child: Text(
//             "预计24小时完成到账，确认提现",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
//           ),
//         ),
//       ),
//     );
//   }
// }
