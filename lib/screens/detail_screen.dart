import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String thumb, title, id;

  const DetailScreen({
    super.key,
    required this.thumb,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(
            letterSpacing: 1.4,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.green,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 14,
                      offset: Offset(14, 10),
                      color: Colors.black45,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
                width: 230,
                child: Image.network(
                  thumb,
                  headers: const {
                    'Referer': 'https://comic.naver.com',
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
