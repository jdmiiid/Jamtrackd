import 'package:flutter/material.dart';

class ArtSearcher extends StatefulWidget {
  const ArtSearcher({super.key});

  @override
  State<ArtSearcher> createState() => _ArtSearcherState();
}

class _ArtSearcherState extends State<ArtSearcher> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color(0xff7e483a),
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(Icons.search),
          prefixIconColor: Color(0xff7e483a),
          hintStyle: TextStyle(color: Color(0xff7e483a)),
          filled: true,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff7e483a)),
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff7e483a))),
          fillColor: Colors.white,
          hintText: 'Please enter an album'),
    );
  }
}
