// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RefreshIndicatorWidget extends StatelessWidget {

  final Widget child;
  final Function onRefresh;

  const RefreshIndicatorWidget({
    Key? key,
    required this.child,
    required this.onRefresh,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh(),
      child: child,
    );
  }
}
