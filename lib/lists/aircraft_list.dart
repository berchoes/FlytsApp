import 'dart:async';
import 'package:flight/models/aircraft_model.dart';
import 'package:flight/services/services.dart';

class AircraftList {
  Stream<List<AircraftModel>> stream;
  bool hasMore;
  int pageNum = 0;
  bool _isLoading;
  List<AircraftModel> _data;
  StreamController<List<AircraftModel>> _controller;

  AircraftList() {
    _data = <AircraftModel>[];
    _controller = StreamController<List<AircraftModel>>.broadcast();
    _isLoading = false;
    stream = _controller.stream;
    hasMore = true;
    loadMore();
  }

  Future<void> loadMore({bool clearCachedData = false}) {
    if (clearCachedData) {
      _data = <AircraftModel>[];
      hasMore = true;
    }
    if (_isLoading || !hasMore) {
      return Future.value();
    }
    _isLoading = true;
    return Services.getAircrafts(pageNum).then((postsData) {
      _isLoading = false;
      pageNum++;
      _data.addAll(postsData);
      hasMore = (postsData.isNotEmpty);
      _controller.add(_data);
    });
  }
}
