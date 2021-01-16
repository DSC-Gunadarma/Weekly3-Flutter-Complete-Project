import 'package:flutter/material.dart';
import 'const.dart';
import 'detail_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week3_complete_project/add_item_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final firestore = FirebaseFirestore.instance;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Home Page",
            style: kWhiteTextStyle.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(kHorizontalMargin),
            // ListView adalah kelas yang berguna untuk membuat tampilan list pada flutter
            // ListView.builder berguna untuk data yang banyak >10
            child: StreamBuilder<QuerySnapshot>(
              stream: firestore.collection('singers').snapshots(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? Center(
                        child: Text(
                          "Waiting",
                          style: kBlackTextStyle.copyWith(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot singers = snapshot.data.docs[index];
                          final name = singers.get('name');
                          final desc = singers.get('desc');
                          final photo = singers.get('photo');

                          return GestureDetector(
                            child: SingerCard(
                              name: name,
                              desc: desc,
                              photo: photo,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    name: name,
                                    desc: desc,
                                    photo: photo,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddItemPage()));
          },
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

// Ini adalah kelas baru untuk membuat custom widget
class SingerCard extends StatelessWidget {
  final String name;
  final String desc;
  final String photo;

  SingerCard({@required this.name, @required this.photo, @required this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: Colors.white),
      // Row berguna untuk membuat layout secara horizontal
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(photo),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: kBlackTextStyle.copyWith(fontSize: 15.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  desc,
                  style: kBlackTextStyle.copyWith(
                    fontSize: 11,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
