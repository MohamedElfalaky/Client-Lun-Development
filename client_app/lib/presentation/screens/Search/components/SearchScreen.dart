import 'package:client_app/data/cubits/NearbyCubit/NearbyCubit.dart';
import 'package:client_app/data/cubits/SearchCubit/SearchCubit.dart';
import 'package:client_app/data/cubits/SearchCubit/SearchState.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/Home/components/NearbyOrder.dart';
import 'package:client_app/presentation/screens/Search/components/SearchField.dart';
import 'package:client_app/presentation/screens/Search/components/SearchedResturants.dart';
import 'package:client_app/presentation/screens/Search/controller/SearchController.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchController _searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchField(),
        SizedBox(
          height: 20,
        ),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return Container(
                height: MyApplication.hightClc(context, 800),
                child: state is SearchSuccess
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.mySearchModel.data!.length,
                        itemBuilder: (context, index) => SearchedResturants(
                            name: state.mySearchModel.data?[index].name,
                            pic: state.mySearchModel.data![index].hasMedia ==
                                    true
                                ? state.mySearchModel.data![index].media!
                                    .where((element) =>
                                        element.collectionName == 'avatar')
                                    .first
                                    .thumb
                                : noReturant))
                    : Center(
                        child: CircularProgressIndicator(),
                      ));
          },
        ),
      ],
    );
  }
}
