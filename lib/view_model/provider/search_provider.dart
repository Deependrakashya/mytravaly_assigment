import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mytravaly/core/services/api_service.dart';
import 'package:mytravaly/data/models/search_auto_suggestion_model.dart';
import 'package:mytravaly/data/repositories/remote/search_repo.dart';

class SearchProvider extends ChangeNotifier {
  List<ByPropertyNameListOfResult> suggestions = [];
  bool isLoading = false;
  final TextEditingController searchController = TextEditingController();
  final SearchRepo _searchRepo = SearchRepo();
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

  void updateSearchText(String text, String query) {
    searchController.text = text;
    log(query);
    _searchRepo.getSearchResult(query: query, pageNo: 1);
    notifyListeners();
  }

  void clearSuggestions() {
    suggestions = [];
    notifyListeners();
  }
}
