import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:omkar_trading/code/constants/service_constants.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImage extends StatefulWidget {
  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  String? url;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        url = ModalRoute.of(context)!.settings.arguments as String;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoView(
          imageProvider: NetworkImage(ServiceConstants.productionURL + url!)),
    );
  }
}
