import 'package:flutter/material.dart';
import 'package:yonntoon/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String thumb, title, id;

  const Webtoon({
    super.key,
    required this.thumb,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(
            thumb: thumb,
            title: title,
            id: id,
          ),
          fullscreenDialog: true,
        ),
      ),
      child: Column(
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
          const SizedBox(
            height: 12,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
