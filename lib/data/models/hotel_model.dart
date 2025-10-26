class HotelModel {
  HotelModel({
    required this.status,
    required this.message,
    required this.responseCode,
    required this.data,
  });

  final bool? status;
  final String? message;
  final int? responseCode;
  final List<Datum> data;

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      status: json["status"],
      message: json["message"],
      responseCode: json["responseCode"],
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  Datum({
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

  final String? propertyName;
  final int? propertyStar;
  final String? propertyImage;
  final String? propertyCode;
  final String? propertyType;
  final PropertyPoliciesAndAmmenities? propertyPoliciesAndAmmenities;
  final Price? markedPrice;
  final Price? staticPrice;
  final GoogleReview? googleReview;
  final String? propertyUrl;
  final PropertyAddress? propertyAddress;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      propertyName: json["propertyName"],
      propertyStar: json["propertyStar"],
      propertyImage: json["propertyImage"],
      propertyCode: json["propertyCode"],
      propertyType: json["propertyType"],
      propertyPoliciesAndAmmenities:
          json["propertyPoliciesAndAmmenities"] == null
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
      propertyUrl: json["propertyUrl"],
      propertyAddress: json["propertyAddress"] == null
          ? null
          : PropertyAddress.fromJson(json["propertyAddress"]),
    );
  }
}

class GoogleReview {
  GoogleReview({required this.reviewPresent, required this.data});

  final bool? reviewPresent;
  final GoogleReviewData? data;

  factory GoogleReview.fromJson(Map<String, dynamic> json) {
    return GoogleReview(
      reviewPresent: json["reviewPresent"],
      data: json["data"] == null
          ? null
          : GoogleReviewData.fromJson(json["data"]),
    );
  }
}

class GoogleReviewData {
  GoogleReviewData({
    required this.overallRating,
    required this.totalUserRating,
    required this.withoutDecimal,
  });

  final double? overallRating;
  final int? totalUserRating;
  final int? withoutDecimal;

  factory GoogleReviewData.fromJson(Map<String, dynamic> json) {
    return GoogleReviewData(
      overallRating: json["overallRating"],
      totalUserRating: json["totalUserRating"],
      withoutDecimal: json["withoutDecimal"],
    );
  }
}

class Price {
  Price({
    required this.amount,
    required this.displayAmount,
    required this.currencyAmount,
    required this.currencySymbol,
  });

  final double? amount;
  final String? displayAmount;
  final String? currencyAmount;
  final String? currencySymbol;

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      amount: json["amount"],
      displayAmount: json["displayAmount"],
      currencyAmount: json["currencyAmount"],
      currencySymbol: json["currencySymbol"],
    );
  }
}

class PropertyAddress {
  PropertyAddress({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.zipcode,
    required this.mapAddress,
    required this.latitude,
    required this.longitude,
  });

  final String? street;
  final String? city;
  final String? state;
  final String? country;
  final String? zipcode;
  final String? mapAddress;
  final double? latitude;
  final double? longitude;

  factory PropertyAddress.fromJson(Map<String, dynamic> json) {
    return PropertyAddress(
      street: json["street"],
      city: json["city"],
      state: json["state"],
      country: json["country"],
      zipcode: json["zipcode"],
      mapAddress: json["map_address"],
      latitude: json["latitude"],
      longitude: json["longitude"],
    );
  }
}

class PropertyPoliciesAndAmmenities {
  PropertyPoliciesAndAmmenities({required this.present, required this.data});

  final bool? present;
  final PropertyPoliciesAndAmmenitiesData? data;

  factory PropertyPoliciesAndAmmenities.fromJson(Map<String, dynamic> json) {
    return PropertyPoliciesAndAmmenities(
      present: json["present"],
      data: json["data"] == null
          ? null
          : PropertyPoliciesAndAmmenitiesData.fromJson(json["data"]),
    );
  }
}

class PropertyPoliciesAndAmmenitiesData {
  PropertyPoliciesAndAmmenitiesData({
    required this.cancelPolicy,
    required this.refundPolicy,
    required this.childPolicy,
    required this.damagePolicy,
    required this.propertyRestriction,
    required this.petsAllowed,
    required this.coupleFriendly,
    required this.suitableForChildren,
    required this.bachularsAllowed,
    required this.freeWifi,
    required this.freeCancellation,
    required this.payAtHotel,
    required this.payNow,
    required this.lastUpdatedOn,
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

  factory PropertyPoliciesAndAmmenitiesData.fromJson(
    Map<String, dynamic> json,
  ) {
    return PropertyPoliciesAndAmmenitiesData(
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
  }
}
