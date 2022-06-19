import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search"
        ),
      ),
      body: const Center(
        child: Text(
            "SearchScreen"
        ),
      ),
    );
  }
}
