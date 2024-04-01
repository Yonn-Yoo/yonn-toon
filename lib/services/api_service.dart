import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yonntoon/models/webtoon_detail_model.dart';
import 'package:yonntoon/models/webtoon_episode_model.dart';
import 'package:yonntoon/models/webtoon_model.dart';

class ApiService {
  static const String baseURL =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];

    final url = Uri.parse('$baseURL/$today');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final List<dynamic> webtoonList = jsonDecode(res.body);
      for (var webtoon in webtoonList) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }

    throw Error();
  }

  static Future<WebtoonDetailModel> getToonByID(String id) async {
    final url = Uri.parse('$baseURL/$id');

    final res = await http.get(url);
    if (res.statusCode == 200) {
      final dynamic webtoonInfo = jsonDecode(res.body);
      return WebtoonDetailModel.fromJson(webtoonInfo);
    }

    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesByID(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse('$baseURL/$id/episodes');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final episodes = jsonDecode(res.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }

    throw Error();
  }
}
