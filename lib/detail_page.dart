import 'package:flutter/material.dart';

import 'const.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String desc;
  final String photo;
  DetailPage({@required this.name, @required this.photo, @required this.desc});

  @override
  Widget build(BuildContext context) {
    /* Note : Design page ini mirip dengan week 1. 
      Jadi tinggal copy paste dan ubah propertinya
    */
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Detail Page",
            style: kWhiteTextStyle.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
          shadowColor: Colors.grey.shade300,
        ),
        body: Container(
          margin: EdgeInsets.all(kHorizontalMargin),
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(photo),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: kBlackTextStyle.copyWith(
                    fontSize: 26,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  desc,
                  style: kBlackTextStyle,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
