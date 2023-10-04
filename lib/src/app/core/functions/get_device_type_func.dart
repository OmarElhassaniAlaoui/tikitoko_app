
import 'package:flutter/material.dart';
import 'package:tikto_app/src/app/core/enums/device_type.dart';


DeviceType getDeviceType(MediaQueryData mediaQueryData ){ 
  Orientation orientation = mediaQueryData.orientation; 
  double deviceWidth = 0; 
  if(orientation == Orientation.landscape){
    deviceWidth = mediaQueryData.size.height;

  }else{
    deviceWidth = mediaQueryData.size.width;
  } 

  if(deviceWidth > 950){
    return DeviceType.desktop;
  }

  if(deviceWidth > 600){
    return DeviceType.tablet;
  }
  return DeviceType.mobile;
}