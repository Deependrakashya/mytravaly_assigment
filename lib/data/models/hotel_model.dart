import 'dart:convert';

class HotelModel {
  HotelModel({
    required this.status,
    required this.message,
    required this.responseCode,
    required this.data,
  });

  final bool status;
  final String message;
  final int responseCode;
  final List<Hotel> data;

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
    status: json["status"] ?? false,
    message: json["message"] ?? "",
    responseCode: json["responseCode"] ?? 0,
    data: json["data"] == null
        ? []
        : List<Hotel>.from(json["data"].map((x) => Hotel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "responseCode": responseCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Hotel {
  Hotel({
    required this.propertyName,
    required this.propertyStar,
    required this.propertyImage,
    required this.propertyCode,
    required this.propertyType,
    required this.propertyPoliciesAndAmmenities,
    required this.markedPrice,
    required this.staticPrice,
    required this.googleReview,
    required this.propertyUrl,
    required this.propertyAddress,
  });

  final String propertyName;
  final int propertyStar;
  final String propertyImage;
  final String propertyCode;
  final String propertyType;
  final PropertyPoliciesAndAmmenities? propertyPoliciesAndAmmenities;
  final Price? markedPrice;
  final Price? staticPrice;
  final GoogleReview? googleReview;
  final String propertyUrl;
  final PropertyAddress? propertyAddress;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
    propertyName: json["propertyName"] ?? "",
    propertyStar: json["propertyStar"] ?? 0,
    propertyImage: json["propertyImage"] ?? "",
    propertyCode: json["propertyCode"] ?? "",
    propertyType: json["propertyType"] ?? "",
    propertyPoliciesAndAmmenities: json["propertyPoliciesAndAmmenities"] == null
        ? null
        : PropertyPoliciesAndAmmenities.fromJson(
            json["propertyPoliciesAndAmmenities"],
          ),
    markedPrice: json["markedPrice"] == null
        ? null
        : Price.fromJson(json["markedPrice"]),
    staticPrice: json["staticPrice"] == null
        ? null
        : Price.fromJson(json["staticPrice"]),
    googleReview: json["googleReview"] == null
        ? null
        : GoogleReview.fromJson(json["googleReview"]),
    propertyUrl: json["propertyUrl"] ?? "",
    propertyAddress: json["propertyAddress"] == null
        ? null
        : PropertyAddress.fromJson(json["propertyAddress"]),
  );

  Map<String, dynamic> toJson() => {
    "propertyName": propertyName,
    "propertyStar": propertyStar,
    "propertyImage": propertyImage,
    "propertyCode": propertyCode,
    "propertyType": propertyType,
    "propertyPoliciesAndAmmenities": propertyPoliciesAndAmmenities?.toJson(),
    "markedPrice": markedPrice?.toJson(),
    "staticPrice": staticPrice?.toJson(),
    "googleReview": googleReview?.toJson(),
    "propertyUrl": propertyUrl,
    "propertyAddress": propertyAddress?.toJson(),
  };
}

class PropertyPoliciesAndAmmenities {
  PropertyPoliciesAndAmmenities({required this.present, this.data});

  final bool present;
  final PoliciesData? data;

  factory PropertyPoliciesAndAmmenities.fromJson(Map<String, dynamic> json) =>
      PropertyPoliciesAndAmmenities(
        present: json["present"] ?? false,
        data: json["data"] == null ? null : PoliciesData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"present": present, "data": data?.toJson()};
}

class PoliciesData {
  PoliciesData({
    this.cancelPolicy,
    this.refundPolicy,
    this.childPolicy,
    this.damagePolicy,
    this.propertyRestriction,
    this.petsAllowed,
    this.coupleFriendly,
    this.suitableForChildren,
    this.bachularsAllowed,
    this.freeWifi,
    this.freeCancellation,
    this.payAtHotel,
    this.payNow,
    this.lastUpdatedOn,
  });

  final String? cancelPolicy;
  final String? refundPolicy;
  final String? childPolicy;
  final String? damagePolicy;
  final String? propertyRestriction;
  final bool? petsAllowed;
  final bool? coupleFriendly;
  final bool? suitableForChildren;
  final bool? bachularsAllowed;
  final bool? freeWifi;
  final bool? freeCancellation;
  final bool? payAtHotel;
  final bool? payNow;
  final DateTime? lastUpdatedOn;

  factory PoliciesData.fromJson(Map<String, dynamic> json) => PoliciesData(
    cancelPolicy: json["cancelPolicy"],
    refundPolicy: json["refundPolicy"],
    childPolicy: json["childPolicy"],
    damagePolicy: json["damagePolicy"],
    propertyRestriction: json["propertyRestriction"],
    petsAllowed: json["petsAllowed"],
    coupleFriendly: json["coupleFriendly"],
    suitableForChildren: json["suitableForChildren"],
    bachularsAllowed: json["bachularsAllowed"],
    freeWifi: json["freeWifi"],
    freeCancellation: json["freeCancellation"],
    payAtHotel: json["payAtHotel"],
    payNow: json["payNow"],
    lastUpdatedOn: DateTime.tryParse(json["lastUpdatedOn"] ?? ""),
  );

  Map<String, dynamic> toJson() => {
    "cancelPolicy": cancelPolicy,
    "refundPolicy": refundPolicy,
    "childPolicy": childPolicy,
    "damagePolicy": damagePolicy,
    "propertyRestriction": propertyRestriction,
    "petsAllowed": petsAllowed,
    "coupleFriendly": coupleFriendly,
    "suitableForChildren": suitableForChildren,
    "bachularsAllowed": bachularsAllowed,
    "freeWifi": freeWifi,
    "freeCancellation": freeCancellation,
    "payAtHotel": payAtHotel,
    "payNow": payNow,
    "lastUpdatedOn": lastUpdatedOn?.toIso8601String(),
  };
}

class Price {
  Price({
    this.amount,
    this.displayAmount,
    this.currencyAmount,
    this.currencySymbol,
  });

  final double? amount;
  final String? displayAmount;
  final String? currencyAmount;
  final String? currencySymbol;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    amount: json["amount"]?.toDouble(),
    displayAmount: json["displayAmount"],
    currencyAmount: json["currencyAmount"],
    currencySymbol: json["currencySymbol"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "displayAmount": displayAmount,
    "currencyAmount": currencyAmount,
    "currencySymbol": currencySymbol,
  };
}

class GoogleReview {
  GoogleReview({required this.reviewPresent, this.data});

  final bool reviewPresent;
  final GoogleReviewData? data;

  factory GoogleReview.fromJson(Map<String, dynamic> json) => GoogleReview(
    reviewPresent: json["reviewPresent"] ?? false,
    data: json["data"] == null ? null : GoogleReviewData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "reviewPresent": reviewPresent,
    "data": data?.toJson(),
  };
}

class GoogleReviewData {
  GoogleReviewData({
    this.overallRating,
    this.totalUserRating,
    this.withoutDecimal,
  });

  final double? overallRating;
  final int? totalUserRating;
  final int? withoutDecimal;

  factory GoogleReviewData.fromJson(Map<String, dynamic> json) =>
      GoogleReviewData(
        overallRating: json["overallRating"]?.toDouble(),
        totalUserRating: json["totalUserRating"],
        withoutDecimal: json["withoutDecimal"],
      );

  Map<String, dynamic> toJson() => {
    "overallRating": overallRating,
    "totalUserRating": totalUserRating,
    "withoutDecimal": withoutDecimal,
  };
}

class PropertyAddress {
  PropertyAddress({
    this.street,
    this.city,
    this.state,
    this.country,
    this.zipcode,
    this.mapAddress,
    this.latitude,
    this.longitude,
  });

  final String? street;
  final String? city;
  final String? state;
  final String? country;
  final String? zipcode;
  final String? mapAddress;
  final double? latitude;
  final double? longitude;

  factory PropertyAddress.fromJson(Map<String, dynamic> json) =>
      PropertyAddress(
        street: json["street"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipcode: json["zipcode"],
        mapAddress: json["map_address"] == "NA" ? null : json["map_address"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
    "street": street,
    "city": city,
    "state": state,
    "country": country,
    "zipcode": zipcode,
    "map_address": mapAddress,
    "latitude": latitude,
    "longitude": longitude,
  };
}
