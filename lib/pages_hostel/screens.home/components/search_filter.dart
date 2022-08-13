import 'package:flutter/material.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({Key? key}) : super(key: key);

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search here",
          prefixIcon: const Icon(
            Icons.search,
            size: 35,
            color: Colors.black,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: const BorderSide(
                  color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: BorderSide(
                  color: Colors.grey.shade400)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: const BorderSide(
                  color: Colors.red, width: 2.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: const BorderSide(
                  color: Colors.red, width: 2.0)),
        ),
      ),
    );
  }
}
