import 'dart:async';
import 'package:flight/models/destination_model.dart';
import 'package:flight/services/services.dart';

class DestinationList {
  Stream<List<Airport>> stream;
  bool hasMore;
  int pageNum = 0;
  bool _isLoading;
  List<Airport> _data;
  StreamController<List<Airport>> _controller;

  DestinationList() {
    _data = <Airport>[];
    _controller = StreamController<List<Airport>>.broadcast();
    _isLoading = false;
    stream = _controller.stream;
    hasMore = true;
    loadMore();
  }

  Future<void> loadMore({bool clearCachedData = false}) {
    if (clearCachedData) {
      _data = <Airport>[];
      hasMore = true;
    }
    if (_isLoading || !hasMore) {
      return Future.value();
    }
    _isLoading = true;
    return Services.getDestinations(pageNum).then((postsData) {
      _isLoading = false;
      pageNum++;
      _data.addAll(postsData);
      hasMore = (postsData.isNotEmpty);
      _controller.add(_data);
    });
  }
}
