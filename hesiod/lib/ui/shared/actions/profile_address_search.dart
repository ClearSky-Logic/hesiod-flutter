import 'package:flutter/material.dart';
import 'package:hesiod/domain/constants/assetsconstants.dart';
import 'package:hesiod/ui/shared/layout/customdivider.dart';
import 'package:hesiod/ui/shared/layout/responsivepadding.dart';
import 'package:hesiod/ui/shared/theme/colour_palette.dart';
import 'package:hesiod/ui/shared/theme/text.dart';

class ProfileAddressSearch extends SearchDelegate<String?> {
  //final ProfileViewModel viewModel;

  ProfileAddressSearch();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        tooltip: 'Back',
        icon: Icon(Icons.adaptive.arrow_back, color: AppColours.primary),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return _searchResults(context);
  }

  @override
  PreferredSizeWidget buildBottom(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      flexibleSpace: GestureDetector(
          onTap: () {
            close(context, null);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             ProfileAddressManualUpdatePage(viewModel)));
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 18.0),
            child: AppText.message("Enter address manually"),
          )),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _searchResults(context);
  }

  Widget _searchResults(context) {
    return ResponsivePadding(
      isNotFullscreen: true,
      child: FutureBuilder(
          future: Future.delayed(Duration(seconds: 1), () => ["1", "2", "3"]),
          builder: (context, AsyncSnapshot<List<String>?> snapshot) =>
              snapshot.hasData
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              close(context, snapshot.data![index]);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             ProfileAddressManualUpdatePage(
                              //                 viewModel)));
                            },
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: AppText.bodyMultiline(
                                          "${snapshot.data![index]}, ${snapshot.data![index]} ")),
                                  const CustomDivider()
                                ]),
                          ))
                  : Center(child: Image.asset(AssetsConstants.logo))),
    );
  }
}
