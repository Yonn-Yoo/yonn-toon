import 'dart:convert';

import 'package:http/http.dart' as http;
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
}
