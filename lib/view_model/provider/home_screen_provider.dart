import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mytravaly/data/models/hotel_model.dart';
import 'package:mytravaly/data/models/search_result_model.dart';
import 'package:mytravaly/data/repositories/remote/home_repo.dart';

class HomeScreenProvider extends ChangeNotifier {
  List<Hotel> hotels = [];
  int page = 1;
  bool isLoadingMore = false;
  HomeRepo _homeRepo = HomeRepo();
  Future<void> getHotels() async {
    HotelModel res = await _homeRepo.getAllHotels(page: page);
    hotels = (res.data).toList();
    page++;
    notifyListeners();
  }

  Future<void> loadMoreHotels() async {
    isLoadingMore = true;
    notifyListeners();
    HotelModel res = await _homeRepo.getAllHotels(page: page);
    page++;
    final data = (res.data);
    hotels.addAll(data);
    isLoadingMore = false;

    notifyListeners();
  }
}
