import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
      height: 50,
      width: 50,
      child: CircularProgressIndicator(
        strokeWidth: 5,
      ),
    ));
  }
}
