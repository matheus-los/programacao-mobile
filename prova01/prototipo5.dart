//Cópia do Instragram

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
          title: Text('InstaClone'),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.blueAccent[100],
        body: Column(
          children: [
            // Stories (scroll horizontal)
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg'),
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

            // Feed (scroll vertical)
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return PostWidget(userName: 'User $index');
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

  const PostWidget({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nome do usuário + botão seguir
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(userName, style: TextStyle(fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {},
                child: Text('Seguir', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),

          SizedBox(height: 8),
          // Imagem com ícone em cima usando Stack
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg'), // Placeholder image
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

          // Ícones de interação
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite_border),
              Icon(Icons.comment_outlined),
              Icon(Icons.send_outlined),
            ],
          ),

          SizedBox(height: 12),

          // Hashtags com Wrap
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
