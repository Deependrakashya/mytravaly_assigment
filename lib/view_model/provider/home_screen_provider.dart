import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mytravaly/data/models/hotel_model.dart';
import 'package:mytravaly/data/models/search_result_model.dart';
import 'package:mytravaly/data/repositories/remote/home_repo.dart';

class HomeScreenProvider extends ChangeNotifier {
  List<ArrayOfHotelList> hotels = [];
  HomeRepo _homeRepo = HomeRepo();
  Future<void> getHotels() async {
    HotelModel res = await _homeRepo.getAllHotels();
    log(res.data.length.toString());
  }
}
