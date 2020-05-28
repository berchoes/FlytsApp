import 'dart:async';

import 'package:flight/models/flight_model.dart';
import 'package:flight/services/services.dart';

class FlightList {
  Stream<List<FlightModel>> stream;
  bool hasMore;
  int pageNum = 0;
  bool _isLoading;
  List<FlightModel> _data;
  StreamController<List<FlightModel>> _controller;

  FlightList() {
    _data = <FlightModel>[];
    _controller = StreamController<List<FlightModel>>.broadcast();
    _isLoading = false;
    stream = _controller.stream;
    hasMore = true;
    loadMore();
  }

  Future<void> loadMore({bool clearCachedData = false}) {
    if (clearCachedData) {
      _data = <FlightModel>[];
      hasMore = true;
    }
    if (_isLoading || !hasMore) {
      return Future.value();
    }
    _isLoading = true;
    return Services.getFlights(pageNum).then((flights) {
      _isLoading = false;
      pageNum++;
      _data.addAll(flights);
      hasMore = (flights.isNotEmpty);
      _controller.add(_data);
    });
  }
}
