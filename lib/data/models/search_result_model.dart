import 'dart:convert';

SearchResultModel searchResultModelFromJson(String str) =>
    SearchResultModel.fromJson(json.decode(str));

class SearchResultModel {
  final bool? status;
  final String? message;
  final int? responseCode;
  final SearchResultModelData? data;

  SearchResultModel({this.status, this.message, this.responseCode, this.data});

  factory SearchResultModel.fromJson(Map<String, dynamic> json) =>
      SearchResultModel(
        status: json["status"],
        message: json["message"],
        responseCode: json["responseCode"],
        data: json["data"] == null
            ? null
            : SearchResultModelData.fromJson(json["data"]),
      );
}

class SearchResultModelData {
  final List<ArrayOfHotelList> arrayOfHotelList;
  final List<String> arrayOfExcludedHotels;
  final List<String> arrayOfExcludedSearchType;

  SearchResultModelData({
    required this.arrayOfHotelList,
    required this.arrayOfExcludedHotels,
    required this.arrayOfExcludedSearchType,
  });

  factory SearchResultModelData.fromJson(
    Map<String, dynamic> json,
  ) => SearchResultModelData(
    arrayOfHotelList: json["arrayOfHotelList"] == null
        ? []
        : List<ArrayOfHotelList>.from(
            json["arrayOfHotelList"].map((x) => ArrayOfHotelList.fromJson(x)),
          ),
    arrayOfExcludedHotels: json["arrayOfExcludedHotels"] == null
        ? []
        : List<String>.from(json["arrayOfExcludedHotels"].map((x) => x)),
    arrayOfExcludedSearchType: json["arrayOfExcludedSearchType"] == null
        ? []
        : List<String>.from(json["arrayOfExcludedSearchType"].map((x) => x)),
  );
}

class ArrayOfHotelList {
  final String? propertyCode;
  final String? propertyName;
  final PropertyImage? propertyImage;
  final String? propertytype;
  final int? propertyStar;
  final PropertyPoliciesAndAmmenities? propertyPoliciesAndAmmenities;
  final PropertyAddress? propertyAddress;
  final String? propertyUrl;
  final String? roomName;
  final int? numberOfAdults;
  final Price? markedPrice;
  final Price? propertyMaxPrice;
  final Price? propertyMinPrice;
  final List<AvailableDeal> availableDeals;
  final SubscriptionStatus? subscriptionStatus;
  final int? propertyView;
  final bool? isFavorite;
  final SimplPriceList? simplPriceList;
  final GoogleReview? googleReview;

  ArrayOfHotelList({
    this.propertyCode,
    this.propertyName,
    this.propertyImage,
    this.propertytype,
    this.propertyStar,
    this.propertyPoliciesAndAmmenities,
    this.propertyAddress,
    this.propertyUrl,
    this.roomName,
    this.numberOfAdults,
    this.markedPrice,
    this.propertyMaxPrice,
    this.propertyMinPrice,
    required this.availableDeals,
    this.subscriptionStatus,
    this.propertyView,
    this.isFavorite,
    this.simplPriceList,
    this.googleReview,
  });

  factory ArrayOfHotelList.fromJson(Map<String, dynamic> json) =>
      ArrayOfHotelList(
        propertyCode: json["propertyCode"],
        propertyName: json["propertyName"],
        propertyImage: json["propertyImage"] == null
            ? null
            : PropertyImage.fromJson(json["propertyImage"]),
        propertytype: json["propertytype"],
        propertyStar: json["propertyStar"],
        propertyPoliciesAndAmmenities:
            json["propertyPoliciesAndAmmenities"] == null
            ? null
            : PropertyPoliciesAndAmmenities.fromJson(
                json["propertyPoliciesAndAmmenities"],
              ),
        propertyAddress: json["propertyAddress"] == null
            ? null
            : PropertyAddress.fromJson(json["propertyAddress"]),
        propertyUrl: json["propertyUrl"],
        roomName: json["roomName"],
        numberOfAdults: json["numberOfAdults"],
        markedPrice: json["markedPrice"] == null
            ? null
            : Price.fromJson(json["markedPrice"]),
        propertyMaxPrice: json["propertyMaxPrice"] == null
            ? null
            : Price.fromJson(json["propertyMaxPrice"]),
        propertyMinPrice: json["propertyMinPrice"] == null
            ? null
            : Price.fromJson(json["propertyMinPrice"]),
        availableDeals: json["availableDeals"] == null
            ? []
            : List<AvailableDeal>.from(
                json["availableDeals"].map((x) => AvailableDeal.fromJson(x)),
              ),
        subscriptionStatus: json["subscriptionStatus"] == null
            ? null
            : SubscriptionStatus.fromJson(json["subscriptionStatus"]),
        propertyView: json["propertyView"],
        isFavorite: json["isFavorite"],
        simplPriceList: json["simplPriceList"] == null
            ? null
            : SimplPriceList.fromJson(json["simplPriceList"]),
        googleReview: json["googleReview"] == null
            ? null
            : GoogleReview.fromJson(json["googleReview"]),
      );
}

class AvailableDeal {
  final String? headerName;
  final String? websiteUrl;
  final String? dealType;
  final Price? price;

  AvailableDeal({this.headerName, this.websiteUrl, this.dealType, this.price});

  factory AvailableDeal.fromJson(Map<String, dynamic> json) => AvailableDeal(
    headerName: json["headerName"],
    websiteUrl: json["websiteUrl"],
    dealType: json["dealType"],
    price: json["price"] == null ? null : Price.fromJson(json["price"]),
  );
}

class Price {
  final double? amount;
  final String? displayAmount;
  final String? currencyAmount;
  final String? currencySymbol;

  Price({
    this.amount,
    this.displayAmount,
    this.currencyAmount,
    this.currencySymbol,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    amount: (json["amount"] is int)
        ? (json["amount"] as int).toDouble()
        : (json["amount"] is double)
        ? json["amount"]
        : double.tryParse(json["amount"].toString()),
    displayAmount: json["displayAmount"],
    currencyAmount: json["currencyAmount"]?.toString(),
    currencySymbol: json["currencySymbol"],
  );
}

class GoogleReview {
  final bool? reviewPresent;
  final GoogleReviewData? data;

  GoogleReview({this.reviewPresent, this.data});

  factory GoogleReview.fromJson(Map<String, dynamic> json) => GoogleReview(
    reviewPresent: json["reviewPresent"],
    data: json["data"] == null ? null : GoogleReviewData.fromJson(json["data"]),
  );
}

class GoogleReviewData {
  final double? overallRating;
  final int? totalUserRating;
  final int? withoutDecimal;

  GoogleReviewData({
    this.overallRating,
    this.totalUserRating,
    this.withoutDecimal,
  });

  factory GoogleReviewData.fromJson(Map<String, dynamic> json) =>
      GoogleReviewData(
        overallRating: (json["overallRating"] is int)
            ? (json["overallRating"] as int).toDouble()
            : json["overallRating"]?.toDouble(),
        totalUserRating: json["totalUserRating"],
        withoutDecimal: json["withoutDecimal"],
      );
}

class PropertyAddress {
  final String? street;
  final String? city;
  final String? state;
  final String? country;
  final String? zipcode;
  final String? mapAddress;
  final double? latitude;
  final double? longitude;

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

  factory PropertyAddress.fromJson(Map<String, dynamic> json) =>
      PropertyAddress(
        street: json["street"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipcode: json["zipcode"],
        mapAddress: json["mapAddress"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );
}

class PropertyImage {
  final String? fullUrl;
  final String? location;
  final String? imageName;

  PropertyImage({this.fullUrl, this.location, this.imageName});

  factory PropertyImage.fromJson(Map<String, dynamic> json) => PropertyImage(
    fullUrl: json["fullUrl"],
    location: json["location"],
    imageName: json["imageName"],
  );
}

class PropertyPoliciesAndAmmenities {
  final bool? present;
  final PropertyPoliciesAndAmmenitiesData? data;

  PropertyPoliciesAndAmmenities({this.present, this.data});

  factory PropertyPoliciesAndAmmenities.fromJson(Map<String, dynamic> json) =>
      PropertyPoliciesAndAmmenities(
        present: json["present"],
        data: json["data"] == null
            ? null
            : PropertyPoliciesAndAmmenitiesData.fromJson(json["data"]),
      );
}

class PropertyPoliciesAndAmmenitiesData {
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

  PropertyPoliciesAndAmmenitiesData({
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

  factory PropertyPoliciesAndAmmenitiesData.fromJson(
    Map<String, dynamic> json,
  ) => PropertyPoliciesAndAmmenitiesData(
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

class SimplPriceList {
  final Price? simplPrice;
  final double? originalPrice;

  SimplPriceList({this.simplPrice, this.originalPrice});

  factory SimplPriceList.fromJson(Map<String, dynamic> json) => SimplPriceList(
    simplPrice: json["simplPrice"] == null
        ? null
        : Price.fromJson(json["simplPrice"]),
    originalPrice: (json["originalPrice"] is int)
        ? (json["originalPrice"] as int).toDouble()
        : (json["originalPrice"] is double)
        ? json["originalPrice"]
        : double.tryParse(json["originalPrice"].toString()),
  );
}

class SubscriptionStatus {
  final bool? status;

  SubscriptionStatus({this.status});

  factory SubscriptionStatus.fromJson(Map<String, dynamic> json) =>
      SubscriptionStatus(status: json["status"]);
}
