import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/quaran_app_cubit.dart';
import '../constants.dart';
import '../strings.dart';

class CustomAppBar extends StatefulWidget {
  final String appBarText;
  final TextEditingController searchController;
  final bool issurahScreen;

  const CustomAppBar(
      {super.key,
      required this.appBarText,
      required this.searchController,
      this.issurahScreen = false});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isSearched = false;
  Widget searchBuildr({required double width, required BuildContext context}) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
          horizontal: width * .01,
          vertical: width * .05,
        ),
        width: width * .9,
        child: TextFormField(
          style: TextStyle(color: MyColors.textColor),
          textAlign: TextAlign.end,
          cursorColor: MyColors.searchColor,
          maxLines: 1,
          autofocus: false,
          enabled: true,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.search_off),
                onPressed: () {
                  setState(() {
                    BlocProvider.of<QuaranAppCubit>(context)
                        .getSearchedText('');
                    widget.searchController.clear();
                    isSearched = false;
                  });
                },
                color: MyColors.searchColor,
              ),
              hintStyle: TextStyle(color: MyColors.textColor),
              hintText: '${MyStrings.arabicString["search_text_feild"]}',
              icon: Icon(
                Icons.search,
                color: MyColors.bottomNavColor,
              ),
              border: InputBorder.none),
          controller: widget.searchController,
          onChanged: (String? newValue) {
            BlocProvider.of<QuaranAppCubit>(context).getSearchedText(newValue!);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (widget.issurahScreen == true && isSearched == false)
            IconButton(
                onPressed: () {
                  setState(() {
                    isSearched = true;
                  });
                },
                icon: Icon(Icons.search)),
          if (widget.issurahScreen == true && isSearched == true)
            BlocBuilder<QuaranAppCubit, QuaranAppState>(
              builder: (context, state) =>
                  searchBuildr(width: screenWidth, context: context),
            ),
          if (widget.issurahScreen == true && isSearched == false) Spacer(),
          if (isSearched == false)
            Text(
              widget.appBarText,
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: MyColors.textColor),
            ),
        ],
      ),
    );
  }
}
