import 'dart:developer';

import 'package:mytravaly/core/services/api_service.dart';
import 'package:mytravaly/data/models/search_auto_suggestion_model.dart';

import 'package:mytravaly/data/models/search_result_model.dart';

class SearchRepo {
  final ApiService _api = ApiService();
  Future<SearchResultModel> getSearchResult({
    required String query,
    required int pageNo,
  }) async {
    log(query);
    final Map<String, dynamic> body = {
      "getSearchResultListOfHotels": {
        "searchCriteria": {
          "checkIn": "2026-07-11",
          "checkOut": "2026-07-12",
          "rooms": 2,
          "adults": 2,
          "children": 0,
          "searchType": "hotelIdSearch",
          "searchQuery": [query],
          "accommodation": [
            "all",
            "hotel", //allowed "hotel","resort","Boat House","bedAndBreakfast","guestHouse","Holidayhome","cottage","apartment","Home Stay", "hostel","Guest House","Camp_sites/tent","co_living","Villa","Motel","Capsule Hotel","Dome Hotel","all"
          ],
          "arrayOfExcludedSearchType": [
            "street", //allowed street, city, state, country
          ],
          "highPrice": "3000000",
          "lowPrice": "0",
          "limit": 5,
          "page": pageNo,
          "preloaderList": [],
          "currency": "INR",
          "rid": 0,
        },
      },
    };

    final res = await _api.getSearchResult(data: body);
    log("response ${res['data']}");
    return SearchResultModel.fromJson(res);
  }

  Future<SearchAutoSuggestionModel> getSearchSuggestions({
    required String query,
  }) async {
    final Map<String, dynamic> body = {
      "searchAutoComplete": {
        "inputText": query,
        "searchType": [
          "byCity",
          "byState",
          "byCountry",
          "byRandom",
          "byPropertyName", // you can put any searchType from the list
        ],
        "limit": 10,
      },
    };

    final res = await _api.getSearchSuggestions(data: body);
    // log(res.toString());
    return SearchAutoSuggestionModel.fromJson(res);
  }
}
