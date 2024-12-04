import 'package:flutter/material.dart';

class Chap10Home extends StatelessWidget {
  const Chap10Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Layouts",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Navigate back when the back button is pressed
          },
          icon: Icon(Icons.arrow_back), // Back button icon
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0), // Add padding to avoid overflow
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.cloud_queue),
            ),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        _buildJournalHeaderImage(),
        SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildJournalEntry(),
                  Divider(),
                  _buildJournalWeather(),
                  Divider(),
                  _buildJournalTags(),
                  Divider(),
                  _buildJournalFooterImages(),
                ],
              ),
            ))
      ],
    ),
  );
}

Image _buildJournalHeaderImage() {
  return Image(
    image: AssetImage("assets/images/gift.jpg"),
    fit: BoxFit.cover,
    height: 200,
  );
}

Column _buildJournalEntry() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "My Birthday",
        style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
      ),
      Divider(),
      Text(
        "Its going to be great birthday. We are going out for Dinner at my favourite place, then watch a movie after we go to the gelateria for ice cream and espresso.",
        style: TextStyle(color: Colors.black54),
      ),
    ],
  );
}

Row _buildJournalWeather() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Column(
        children: <Widget>[
          Icon(
            Icons.wb_sunny,
            color: Colors.orange,
          ),
        ],
      ),
      SizedBox(
        width: 16.0,
      ),
      Expanded( // Wrap the second column with Expanded to prevent overflow
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "81 Clear",
                  style: TextStyle(
                    color: Colors.deepOrange,
                  ),
                  overflow: TextOverflow.ellipsis, // Handle overflow if needed
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "4500 San Alpho Drive, Dallas",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.fade, // Handle overflow if needed
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );

}

Wrap _buildJournalTags() {
  return Wrap(
    spacing: 8.0,
    children: List.generate(5, (int index) {
      return Chip(
        label: Text(
          'Gift ${index + 1}',
          style: TextStyle(
            fontSize: 10.0,
          ),
        ),
        avatar: Icon(
          Icons.card_giftcard,
          color: Colors.blue.shade300,
        ),
      );
    }),
  );
}

Row _buildJournalFooterImages() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Flexible(
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Latte.png'),
          radius: 40.0,
        ),
      ),
      Flexible(
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Espresso.png'),
          radius: 40.0,
        ),
      ),
      Flexible(
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/tomato.jpg'),
          radius: 40.0,
        ),
      ),
      SizedBox(
        width: 100.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.cake),
            Icon(Icons.star_border),
            Icon(Icons.music_note),
          ],
        ),
      ),
    ],
  );

}
