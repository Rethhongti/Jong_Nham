import 'package:flutter/material.dart';

class SearchOptionWidget extends StatelessWidget {
  const SearchOptionWidget({Key? key,
    required this.optionName,
    this.isFilter = false
  }) : super(key: key);

  final String optionName;
  final bool isFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5,5,0,5),
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade700,
        borderRadius: const BorderRadius.all(Radius.circular(3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isFilter ? const Icon(Icons.filter_list,
            color: Colors.white,
          ) : Container(),
          Text(optionName,
            style: const TextStyle(
                color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}
