import 'package:flutter/material.dart';
import 'const.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Add Item Page",
          style: kWhiteTextStyle.copyWith(
              fontSize: 18, fontWeight: FontWeight.bold),
        ),
        shadowColor: Colors.grey.shade300,
      ),
      body: Container(
          margin: EdgeInsets.all(kHorizontalMargin),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage("images/empty_pic.png"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Nama Penyanyi",
                      hintText: "Nama Penyanyi"),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: descController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Tentang Penyanyi",
                    hintText: "Tentang Penyanyi",
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: kAccentColor1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Add Data",
                      style: kWhiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )),
    );
  }
}
