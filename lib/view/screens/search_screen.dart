import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mytravaly/view/widgets/hotel_card.dart';
import 'package:mytravaly/view/widgets/search_field.dart';
import 'package:mytravaly/view_model/provider/search_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Detect scroll to bottom
    _scrollController.addListener(() {
      final provider = Provider.of<SearchProvider>(context, listen: false);
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !provider.isLoadingMore) {
        log("loading more hotesl ");
        provider.loadMoreHotels();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SearchProvider>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Expanded(child: SearchField()),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: provider.hotelSearchResult.length + 1,
                itemBuilder: (context, index) {
                  if (index < provider.hotelSearchResult.length) {
                    final hotel = provider.hotelSearchResult[index];
                    return HotelCard(
                      rating: hotel.propertyStar ?? 0,
                      originalPrice: hotel.markedPrice?.amount ?? 0,
                      price: hotel.propertyMinPrice?.amount ?? 0.0,
                      totalReviews:
                          hotel.googleReview?.data?.totalUserRating ?? 0,
                      name: hotel.propertyName.toString(),
                      address:
                          "${hotel.propertyAddress?.city}, ${hotel.propertyAddress?.state}, ${hotel.propertyAddress?.country}",
                      currencySymbol: hotel.markedPrice?.currencySymbol ?? "",
                      imageUrl: hotel.propertyImage?.fullUrl ?? "",
                    );
                  } else {
                    if (provider.isLoadingMore) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () => provider.loadMoreHotels(),
                          child: const Text("Load More"),
                        ),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
