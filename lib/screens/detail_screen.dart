import 'package:flutter/material.dart';
import 'package:yonntoon/models/webtoon_detail_model.dart';
import 'package:yonntoon/models/webtoon_episode_model.dart';
import 'package:yonntoon/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String thumb, title, id;

  const DetailScreen({
    super.key,
    required this.thumb,
    required this.title,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonByID(widget.id);
    episodes = ApiService.getLatestEpisodesByID(widget.id);
  }

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
          widget.title,
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
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.id,
                child: Container(
                  width: 290,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 20,
                        offset: Offset(14, 10),
                        color: Colors.black45,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.network(
                    widget.thumb,
                    headers: const {
                      'Referer': 'https://comic.naver.com',
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          FutureBuilder(
            future: webtoon,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                  ),
                  child: Column(
                    children: [
                      Text(
                        snapshot.data!.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${snapshot.data!.genre} - ${snapshot.data!.age}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        snapshot.data!.about,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Text('loading...');
            },
          )
        ],
      ),
    );
  }
}
