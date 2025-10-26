class SearchAutoSuggestionModel {
  SearchAutoSuggestionModel({
    required this.status,
    required this.message,
    required this.responseCode,
    required this.data,
  });

  final bool? status;
  final String? message;
  final int? responseCode;
  final Data? data;

  factory SearchAutoSuggestionModel.fromJson(Map<String, dynamic> json) {
    return SearchAutoSuggestionModel(
      status: json["status"],
      message: json["message"],
      responseCode: json["responseCode"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }
}

class Data {
  Data({
    required this.present,
    required this.totalNumberOfResult,
    required this.autoCompleteList,
  });

  final bool? present;
  final int? totalNumberOfResult;
  final AutoCompleteList? autoCompleteList;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      present: json["present"],
      totalNumberOfResult: json["totalNumberOfResult"],
      autoCompleteList: json["autoCompleteList"] == null
          ? null
          : AutoCompleteList.fromJson(json["autoCompleteList"]),
    );
  }
}

class AutoCompleteList {
  AutoCompleteList({
    required this.byPropertyName,
    required this.byStreet,
    required this.byCity,
    required this.byState,
    required this.byCountry,
  });

  final ByPropertyName? byPropertyName;
  final By? byStreet;
  final By? byCity;
  final By? byState;
  final ByCountry? byCountry;

  factory AutoCompleteList.fromJson(Map<String, dynamic> json) {
    return AutoCompleteList(
      byPropertyName: json["byPropertyName"] == null
          ? null
          : ByPropertyName.fromJson(json["byPropertyName"]),
      byStreet: json["byStreet"] == null ? null : By.fromJson(json["byStreet"]),
      byCity: json["byCity"] == null ? null : By.fromJson(json["byCity"]),
      byState: json["byState"] == null ? null : By.fromJson(json["byState"]),
      byCountry: json["byCountry"] == null
          ? null
          : ByCountry.fromJson(json["byCountry"]),
    );
  }
}

class By {
  By({
    required this.present,
    required this.listOfResult,
    required this.numberOfResult,
  });

  final bool? present;
  final List<ByCityListOfResult> listOfResult;
  final int? numberOfResult;

  factory By.fromJson(Map<String, dynamic> json) {
    return By(
      present: json["present"],
      listOfResult: json["listOfResult"] == null
          ? []
          : List<ByCityListOfResult>.from(
              json["listOfResult"]!.map((x) => ByCityListOfResult.fromJson(x)),
            ),
      numberOfResult: json["numberOfResult"],
    );
  }
}

class ByCityListOfResult {
  ByCityListOfResult({
    required this.valueToDisplay,
    required this.address,
    required this.searchArray,
  });

  final String? valueToDisplay;
  final PurpleAddress? address;
  final SearchArray? searchArray;

  factory ByCityListOfResult.fromJson(Map<String, dynamic> json) {
    return ByCityListOfResult(
      valueToDisplay: json["valueToDisplay"],
      address: json["address"] == null
          ? null
          : PurpleAddress.fromJson(json["address"]),
      searchArray: json["searchArray"] == null
          ? null
          : SearchArray.fromJson(json["searchArray"]),
    );
  }
}

class PurpleAddress {
  PurpleAddress({
    required this.city,
    required this.state,
    required this.country,
    required this.street,
  });

  final String? city;
  final String? state;
  final String? country;
  final String? street;

  factory PurpleAddress.fromJson(Map<String, dynamic> json) {
    return PurpleAddress(
      city: json["city"],
      state: json["state"],
      country: json["country"],
      street: json["street"],
    );
  }
}

class SearchArray {
  SearchArray({required this.type, required this.query});

  final String? type;
  final List<String> query;

  factory SearchArray.fromJson(Map<String, dynamic> json) {
    return SearchArray(
      type: json["type"],
      query: json["query"] == null
          ? []
          : List<String>.from(json["query"]!.map((x) => x)),
    );
  }
}

class ByCountry {
  ByCountry({
    required this.present,
    required this.listOfResult,
    required this.numberOfResult,
  });

  final bool? present;
  final List<ByCountryListOfResult> listOfResult;
  final int? numberOfResult;

  factory ByCountry.fromJson(Map<String, dynamic> json) {
    return ByCountry(
      present: json["present"],
      listOfResult: json["listOfResult"] == null
          ? []
          : List<ByCountryListOfResult>.from(
              json["listOfResult"]!.map(
                (x) => ByCountryListOfResult.fromJson(x),
              ),
            ),
      numberOfResult: json["numberOfResult"],
    );
  }
}

class ByCountryListOfResult {
  ByCountryListOfResult({
    required this.valueToDisplay,
    required this.address,
    required this.searchArray,
  });

  final String? valueToDisplay;
  final FluffyAddress? address;
  final SearchArray? searchArray;

  factory ByCountryListOfResult.fromJson(Map<String, dynamic> json) {
    return ByCountryListOfResult(
      valueToDisplay: json["valueToDisplay"],
      address: json["address"] == null
          ? null
          : FluffyAddress.fromJson(json["address"]),
      searchArray: json["searchArray"] == null
          ? null
          : SearchArray.fromJson(json["searchArray"]),
    );
  }
}

class FluffyAddress {
  FluffyAddress({required this.country});

  final String? country;

  factory FluffyAddress.fromJson(Map<String, dynamic> json) {
    return FluffyAddress(country: json["country"]);
  }
}

class ByPropertyName {
  ByPropertyName({
    required this.present,
    required this.listOfResult,
    required this.numberOfResult,
  });

  final bool? present;
  final List<ByPropertyNameListOfResult> listOfResult;
  final int? numberOfResult;

  factory ByPropertyName.fromJson(Map<String, dynamic> json) {
    return ByPropertyName(
      present: json["present"],
      listOfResult: json["listOfResult"] == null
          ? []
          : List<ByPropertyNameListOfResult>.from(
              json["listOfResult"]!.map(
                (x) => ByPropertyNameListOfResult.fromJson(x),
              ),
            ),
      numberOfResult: json["numberOfResult"],
    );
  }
}

class ByPropertyNameListOfResult {
  ByPropertyNameListOfResult({
    required this.valueToDisplay,
    required this.propertyName,
    required this.address,
    required this.searchArray,
  });

  final String? valueToDisplay;
  final String? propertyName;
  final TentacledAddress? address;
  final SearchArray? searchArray;

  factory ByPropertyNameListOfResult.fromJson(Map<String, dynamic> json) {
    return ByPropertyNameListOfResult(
      valueToDisplay: json["valueToDisplay"],
      propertyName: json["propertyName"],
      address: json["address"] == null
          ? null
          : TentacledAddress.fromJson(json["address"]),
      searchArray: json["searchArray"] == null
          ? null
          : SearchArray.fromJson(json["searchArray"]),
    );
  }
}

class TentacledAddress {
  TentacledAddress({required this.city, required this.state});

  final String? city;
  final String? state;

  factory TentacledAddress.fromJson(Map<String, dynamic> json) {
    return TentacledAddress(city: json["city"], state: json["state"]);
  }
}
