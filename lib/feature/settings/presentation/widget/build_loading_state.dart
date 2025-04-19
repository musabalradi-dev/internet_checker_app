import 'package:flutter/material.dart';

Widget buildLoadingState() {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 16),
        Text('Checking connection...'),
      ],
    ),
  );
}