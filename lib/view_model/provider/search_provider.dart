import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mytravaly/core/services/api_service.dart';
import 'package:mytravaly/data/models/search_auto_suggestion_model.dart';
import 'package:mytravaly/data/models/search_result_model.dart';
import 'package:mytravaly/data/repositories/remote/search_repo.dart';
import 'package:mytravaly/view/screens/search_screen.dart';

class SearchProvider extends ChangeNotifier {
  List<ByPropertyNameListOfResult> suggestions = [];
  List<ArrayOfHotelList> hotelSearchResult = [];
  String storedQuery = "";
  bool isLoading = false;
  int page = 1;
  bool isLoadingMore = false;
  final TextEditingController searchController = TextEditingController();
  final SearchRepo _searchRepo = SearchRepo();

  @override
  void dispose() {
    log("disposed");
    searchController.dispose();
    super.dispose();
  }

  Future<List<ByPropertyNameListOfResult>> fetchSuggestions(
    String pattern,
  ) async {
    if (pattern.length < 3) return [];

    isLoading = true;
    notifyListeners();

    try {
      final res = await _searchRepo.getSearchSuggestions(query: pattern);
      final results =
          res.data?.autoCompleteList?.byPropertyName?.listOfResult ?? [];
      return results;
    } catch (e) {
      log("Error fetching suggestions: $e");
      return [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void updateSearchText(String text, String query, BuildContext context) async {
    searchController.text = text;
    page = 1;
    storedQuery = query;

    final res = await _searchRepo.getSearchResult(query: query, pageNo: page);
    log("response = ${res.data?.arrayOfHotelList}");
    if (res.data?.arrayOfHotelList != null) {
      hotelSearchResult = res.data!.arrayOfHotelList!;
    }

    page++;
    notifyListeners();
  }

  void loadMoreHotels() async {
    try {
      log("loading more $storedQuery $page");
      isLoadingMore = true;
      notifyListeners();
      final res = await _searchRepo.getSearchResult(
        query: storedQuery,
        pageNo: page,
      );

      if (res.data?.arrayOfHotelList != null) {
        final newHotels = res.data!.arrayOfHotelList!;

        final existingCodes = hotelSearchResult
            .map((h) => h.propertyCode)
            .toSet();

        final uniqueHotels = newHotels
            .where((hotel) => !existingCodes.contains(hotel.propertyCode))
            .toList();

        hotelSearchResult.addAll(uniqueHotels);
        page++;
      }
    } catch (e) {
    } finally {
      isLoadingMore = false;

      notifyListeners();
    }
  }

  void clearSuggestions() {
    suggestions = [];
    notifyListeners();
  }
}
