import 'package:flutter/material.dart';
import 'package:jong_nham/app_index.dart';


class SearchTextField extends StatelessWidget {
  SearchTextField({Key? key,
    required this.onSubmitted,
    required this.controller
  }) : super(key: key);

  final Function(String) onSubmitted;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        onSubmitted: onSubmitted,
        // focusNode: focusNode,
        // onEditingComplete: () => focusNode!.unfocus(),
        // onChanged: (value) => print(value),
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10),
            hintText: "Search",
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14
            ),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Container(
              constraints: const BoxConstraints(
                maxHeight: 20,
                maxWidth: 20,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: const Icon(Icons.search_outlined,
                color: JongNhamAppColors.MAINCOLOR,
              )
            ),
            suffixIcon: controller.text.isNotEmpty ? GestureDetector(
              onTap: () {
                controller.clear();
              },
              child: Icon(Icons.cancel,
                size: 18,
                color: Colors.black38,
              ),
            ) : null,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(5))
            )
        ),
      ),
    );
  }
}
