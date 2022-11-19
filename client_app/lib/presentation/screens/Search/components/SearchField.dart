import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/Search/controller/SearchController.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchField extends StatelessWidget {
  SearchField();

  final SearchController _searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MyApplication.hightClc(context, 6),
        ),
        TextFormField(
            controller: _searchController.controller,

            // textAlignVertical: TextAlignVertical.center,
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: "Search your favorite restaurant...",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  )),
              focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),

              prefixIcon: InkWell(
                onTap: () => _searchController.SearchAPIs(context),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: SvgPicture.asset(
                    searchIcon,
                  ),
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.close),
                onPressed: () => null,
              ),
              // hintText: myHint
            )),
      ],
    );
  }
}
