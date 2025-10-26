import 'package:mytravaly/core/services/api_service.dart';
import 'package:mytravaly/data/models/hotel_model.dart';

class HomeRepo {
  ApiService _api = ApiService();
  Future<HotelModel> getAllHotels() async {
    final Map<String, dynamic> body = {
      "action": "popularStay",
      "popularStay": {
        "limit": 10, //maximum 10
        "entityType": "Any", //hotel, resort, Home Stay, Camp_sites/tent, Any
        "filter": {
          "searchType": "byCity", //byCity, byState, byCountry, byRandom,
          "searchTypeInfo": {
            "country": "India",
            "state": "Jharkhand",
            "city": "Jamshedpur",
          },
        },
        "currency": "INR",
      },
    };
    final res = await _api.getHotels(data: body);
    return HotelModel.fromJson(res);
  }
}
