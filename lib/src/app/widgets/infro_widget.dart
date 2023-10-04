import 'package:flutter/material.dart';
import 'package:tikto_app/src/app/core/functions/get_device_type_func.dart';
import 'package:tikto_app/src/app/core/models/device_info_model.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key, this.builder}) : super(key: key);
  final Widget Function(BuildContext context, DeviceInfo deviceInfo)? builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        var mediaQueryData = MediaQuery.of(context); 

        DeviceInfo deviceType = DeviceInfo( 
          orientation: mediaQueryData.orientation,
          deviceType: getDeviceType(mediaQueryData),
          screenWidth: mediaQueryData.size.width,
          screenHeight: mediaQueryData.size.height,
          localWidth: constrains.maxWidth,
          localHeight: constrains.maxHeight,
        );  

        return builder!(context, deviceType); 
      },
    );
  }
}
