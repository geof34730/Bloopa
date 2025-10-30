import 'dart:async';
import 'package:flutter/material.dart';

import '../../../global.dart';


class IntelligentSearchWidget extends StatefulWidget {

   double? widthSearch;

   IntelligentSearchWidget({
      super.key,
      this.widthSearch
   });

  @override
  State<IntelligentSearchWidget> createState() => _IntelligentSearchWidgetState();
}

class _IntelligentSearchWidgetState extends State<IntelligentSearchWidget> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
     super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.widthSearch != null) {
      return Padding(
        padding: const EdgeInsets.all(0.0),
        child: SizedBox(
            width: widget.widthSearch ?? double.infinity, // max width
            child:fieldSearch()
        ),
      );
    } else {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: fieldSearch(),
        ),
      );
    }
  }

  TextField fieldSearch(){
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Rechercher sur $globalBrandName...',
        prefixIcon: const Icon(
            Icons.search
        ),
        suffixIcon: _searchController.text.isNotEmpty
            ? IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            _searchController.clear();
          },
        )
            : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
