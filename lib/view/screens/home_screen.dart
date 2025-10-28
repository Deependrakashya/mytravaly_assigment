import 'package:flutter/material.dart';
import 'package:mytravaly/view/widgets/hotel_card.dart';
import 'package:mytravaly/view/widgets/search_field.dart';
import 'package:mytravaly/view_model/provider/home_screen_provider.dart';
import 'package:mytravaly/view_model/provider/search_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    final provider = Provider.of<HomeScreenProvider>(context, listen: false);
    provider.getHotels();

    // Detect scroll to bottom
    _scrollController.addListener(() {
      final provider = Provider.of<HomeScreenProvider>(context, listen: false);
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !provider.isLoadingMore) {
        provider.loadMoreHotels();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeScreenProvider>();
    final sprovider = context.watch<SearchProvider>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchField(),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: provider.hotels.length + 1, // +1 for load more UI
                itemBuilder: (context, index) {
                  if (index < provider.hotels.length) {
                    final hotel = provider.hotels[index];
                    return HotelCard(
                      imageUrl: hotel.propertyImage,
                      name: hotel.propertyName,
                      address:
                          "${hotel.propertyAddress?.city}, ${hotel.propertyAddress?.state}, ${hotel.propertyAddress?.country}",
                      rating: hotel.propertyStar ?? 0,
                      totalReviews:
                          hotel.googleReview?.data?.totalUserRating ?? 0,
                      currencySymbol: hotel.markedPrice?.currencySymbol ?? "",
                      price: hotel.staticPrice?.amount ?? 0,
                      originalPrice: hotel.markedPrice?.amount,
                    );
                  } else {
                    // Load more section
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
