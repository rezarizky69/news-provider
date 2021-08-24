import 'dart:convert';

import 'package:flutter_news_provider/models/top_stories_model.dart';

import 'package:http/http.dart' as http;

class ApiService {
  Future<List<TopStoriesModel>?> getTopStories() async {
    var response = await http.get(Uri.parse(
        'https://api.nytimes.com/svc/topstories/v2/world.json?api-key=GN7xG14Z40flVnMsFydHD7FKm4LpDwhJ'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data['num_results']);

      List<TopStoriesModel> topStories = [];

      List results = data['results'];
      results.forEach((element) {
        if (element['multimedia'] != null) {
          topStories.add(TopStoriesModel.fromJson(element));
        }
      });
      return topStories;
    } else {
      print('\response code failed - \n');
      print(response.statusCode);
      return null;
    }
  }

  Future<List<TopStoriesModel>?> getTopArtsStories() async {
    var response = await http.get(Uri.parse(
        'https://api.nytimes.com/svc/topstories/v2/arts.json?api-key=GN7xG14Z40flVnMsFydHD7FKm4LpDwhJ'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data['num_results']);

      List<TopStoriesModel> topArtsStories = [];

      List results = data['results'];
      results.forEach((element) {
        if (element['multimedia'] != null) {
          topArtsStories.add(TopStoriesModel.fromJson(element));
        }
      });
      return topArtsStories;
    } else {
      print('\response code failed - \n');
      print(response.statusCode);
      return null;
    }
  }

  Future<List<TopStoriesModel>?> getTopScienceStories() async {
    var response = await http.get(Uri.parse(
        'https://api.nytimes.com/svc/topstories/v2/science.json?api-key=GN7xG14Z40flVnMsFydHD7FKm4LpDwhJ'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data['num_results']);

      List<TopStoriesModel> topScienceStories = [];

      List results = data['results'];
      results.forEach((element) {
        if (element['multimedia'] != null) {
          topScienceStories.add(TopStoriesModel.fromJson(element));
        }
      });
      return topScienceStories;
    } else {
      print('\response code failed - \n');
      print(response.statusCode);
      return null;
    }
  }
}
