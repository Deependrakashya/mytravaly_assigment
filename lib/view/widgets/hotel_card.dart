import 'package:flutter/material.dart';

class HotelCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String address;
  final int rating;
  final int totalReviews;
  final String currencySymbol;
  final double price;
  final double? originalPrice;

  const HotelCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.rating,
    required this.totalReviews,
    required this.currencySymbol,
    required this.price,
    this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Card(
        shadowColor: Colors.transparent,
        color: Colors.black,
        surfaceTintColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🖼 Hotel Image
              Container(
                height: 225,
                color: const Color.fromARGB(125, 158, 158, 158),
                width: double.infinity,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Center(
                    child: Icon(Icons.broken_image, color: Colors.white),
                  ),
                ),
              ),

              //  Hotel Info
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //  Rating Row
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          Text(
                            " $rating ",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            " ($totalReviews)",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      //  Hotel Name
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      //  Address
                      Text(
                        address,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(216, 255, 255, 255),
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      //  Prices
                      Row(
                        children: [
                          Text(
                            "$currencySymbol$price ",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.amber,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (originalPrice != null)
                            Text(
                              "$currencySymbol$originalPrice",
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                decorationColor:
                                    Colors.white, // <-- color of the cross line
                                decorationThickness:
                                    2, // optional: make line thicker
                                color: Colors.white, // text color
                                fontSize: 12,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
