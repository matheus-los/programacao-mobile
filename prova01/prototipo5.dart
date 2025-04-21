//Cópia do Instagram

import 'package:flutter/material.dart';

void main() {
  runApp(InstagramClone());
}

class InstagramClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.camera_alt, color: Colors.black),
              SizedBox(width: 8),
              Text('InstaClone'),
            ],
          ),
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
        backgroundColor: Colors.blueAccent[100],
        body: Column(
          children: [
            Container(
              height: 120,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [Colors.red, Colors.orange],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  'https://randomuser.me/api/portraits/men/$index.jpg'),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('User $index', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return PostWidget(userName: 'User $index', postIndex: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final String userName;
  final int postIndex;

  const PostWidget({Key? key, required this.userName, required this.postIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16, left: 8, right: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05).withValues(),
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/men/$postIndex.jpg'),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(userName,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: Text('Seguir'),
              ),
            ],
          ),
          SizedBox(height: 8),
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://picsum.photos/seed/post$postIndex/600/300'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.play_circle, size: 32, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite_border),
              Icon(Icons.comment_outlined),
              Icon(Icons.send_outlined),
            ],
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 6,
            children: [
              Chip(label: Text('#Flutter')),
              Chip(label: Text('#Dart')),
              Chip(label: Text('#MobileDev')),
            ],
          ),
        ],
      ),
    );
  }
}
