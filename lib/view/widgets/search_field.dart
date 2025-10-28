import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mytravaly/data/models/search_auto_suggestion_model.dart';
import 'package:mytravaly/view/screens/search_screen.dart';
import 'package:provider/provider.dart';
import 'package:mytravaly/view_model/provider/search_provider.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SearchProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TypeAheadField<ByPropertyNameListOfResult>(
        emptyBuilder: (context) => Container(
          padding: EdgeInsets.all(20),
          child: Text("atleast type 3 char to get suggestions"),
        ),
        suggestionsCallback: (pattern) async {
          if (pattern.length < 3) return [];
          return await provider.fetchSuggestions(pattern);
        },
        builder: (context, controller, focusNode) {
          provider.searchController.addListener(() {
            controller.text = provider.searchController.text;
          });

          return TextField(
            controller: provider.searchController,
            focusNode: focusNode,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search Hotels Near You",
              labelText: "Search Hotels",
              suffixIcon: provider.isLoading
                  ? const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    )
                  : null,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: .8, color: Colors.black),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: .8, color: Colors.black),
              ),
            ),
          );
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion.propertyName ?? 'Unknown Hotel'),
            subtitle: Text(
              "${suggestion.address?.city ?? ''}, ${suggestion.address?.state ?? ''}",
            ),
            onTap: () {
              provider.updateSearchText(
                suggestion.propertyName ?? '',
                suggestion.searchArray!.query[0],
                context,
              );
              provider.clearSuggestions();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          );
        },
        onSelected: (suggestion) {},
        loadingBuilder: (context) => const Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
        ),
        decorationBuilder: (context, child) => Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(10),
          child: child,
        ),
      ),
    );
  }
}
