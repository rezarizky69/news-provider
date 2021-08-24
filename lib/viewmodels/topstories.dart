import 'package:flutter/cupertino.dart';
import 'package:flutter_news_provider/models/top_stories_model.dart';
import 'package:flutter_news_provider/services/api_service.dart';

class TopStoriesProvider extends ChangeNotifier {
  List<TopStoriesModel> _topStoriesList = [];

  List<TopStoriesModel> get topStoriesList => _topStoriesList;

  List<TopStoriesModel> _topArtsStoriesList = [];

  List<TopStoriesModel> get topArtsStoriesList => _topArtsStoriesList;

  List<TopStoriesModel> _topScienceStoriesList = [];

  List<TopStoriesModel> get topScienceStoriesList => _topScienceStoriesList;

  String status = isStatus.stopped.toString();

  getTopStoriesList() async {
    status = isStatus.running.toString();
    try {
      _topStoriesList = (await ApiService().getTopStories())!;
      if (_topStoriesList != null) {
        status = isStatus.successful.toString();
        notifyListeners();
      } else {
        status = isStatus.wasnull.toString();
        print('news was null');
        getTopStoriesList();
      }
    } catch (e) {
      status = isStatus.error.toString();
      print('\n error \n');
      print(e);
    }
    status = isStatus.stopped.toString();
  }

  getTopArtsStoriesList() async {
    status = isStatus.running.toString();
    try {
      _topArtsStoriesList = (await ApiService().getTopArtsStories())!;
      if (_topArtsStoriesList != null) {
        status = isStatus.successful.toString();
        notifyListeners();
      } else {
        status = isStatus.wasnull.toString();
        print('news was null');
        getTopArtsStoriesList();
      }
    } catch (e) {
      status = isStatus.error.toString();
      print('\n error \n');
      print(e);
    }
    status = isStatus.stopped.toString();
  }

  getTopScienceStoriesList() async {
    status = isStatus.running.toString();
    try {
      _topScienceStoriesList = (await ApiService().getTopScienceStories())!;
      if (_topScienceStoriesList != null) {
        status = isStatus.successful.toString();
        notifyListeners();
      } else {
        status = isStatus.wasnull.toString();
        print('news was null');
        getTopScienceStoriesList();
      }
    } catch (e) {
      status = isStatus.error.toString();
      print('\n error \n');
      print(e);
    }
    status = isStatus.stopped.toString();
  }
}

enum isStatus {
  wasnull,
  running,
  stopped,
  paused,
  error,
  successful,
}
