import 'package:flutter/material.dart';

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String ipsum =
        'I am the child of Pakistani immigrants who moved to Kenya a century ago. Thus, I have experience with the cultures of both countries.';

    List<String> cultures = [
      'Kutchi',
      'Punjabi',
      'Kenya',
    ];

    List<String> badges = [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
      'assets/images/4.png',
      'assets/images/5.png',
      'assets/images/6.png',
      'assets/images/7.png',
      'assets/images/8.png',
      'assets/images/9.png',
    ];

    Future<void> _showMyDialog(index) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            content: AspectRatio(
              aspectRatio: 1,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ),
                  Image(image: AssetImage(badges[index])),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Kenyan and Proud',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'This badge is earned by creating a post about a Kenyan culture',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Earned on: 18/03/2021',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 40,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/me.jpg'),
                  radius: 38,
                ),
              ),
              Column(
                children: [
                  Text(
                    '4',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text('Rank', style: TextStyle(fontSize: 17))
                ],
              ),
              Column(
                children: [
                  Text(
                    '31',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text('Posts', style: TextStyle(fontSize: 17))
                ],
              ),
              Column(
                children: [
                  Text(
                    '29k',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text('Points', style: TextStyle(fontSize: 17))
                ],
              ),
              Column(
                children: [
                  Text(
                    '300',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text('Badges', style: TextStyle(fontSize: 17))
                ],
              )
            ],
          ),
        ),
        Divider(
          height: 5,
          thickness: 2,
        ),
        Align(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Text(
              'Bio',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 2),
            ),
          ),
          alignment: Alignment.topLeft,
        ),
        Align(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              ipsum,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          alignment: Alignment.topLeft,
        ),
        Divider(
          height: 5,
          thickness: 2,
        ),
        Align(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
            child: Text(
              'Cultures',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 2),
            ),
          ),
          alignment: Alignment.topLeft,
        ),
        Container(
          height: 30,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cultures.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 8, 0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Text(
                          cultures[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                    ),
                  );
                }),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 5,
          thickness: 2,
        ),
        Align(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
            child: Text(
              'Featured Badges',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 2),
            ),
          ),
          alignment: Alignment.topLeft,
        ),
        Container(
          height: 70,
          child: Center(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: GestureDetector(
                    onTap: () => _showMyDialog(index),
                    child: Image(
                      image: AssetImage(badges[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          height: 5,
          thickness: 2,
        ),
        Align(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
            child: Text(
              'All Badges',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 2),
            ),
          ),
          alignment: Alignment.topLeft,
        ),
        GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            primary: true,
            shrinkWrap: true,
            itemCount: badges.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: GestureDetector(
                  onTap: () => _showMyDialog(index),
                  child: Image(
                    image: AssetImage(badges[index]),
                    height: 64,
                  ),
                ),
              );
            }),
      ],
    );
  }
}
