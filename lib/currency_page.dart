import 'package:currency/models/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currency/compare_page.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage(this._listCurrency, {Key? key}) : super(key: key);
  final  List<CurrencyModel> _listCurrency;
  

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1f2235),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  fillColor: const Color(0xff2d334d),
                  filled: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                    size: 20,
                  ),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.clear,
                          color: Colors.white, size: 20)),
                ),
              ),
            ),
            Flexible(child: ListView.separated(itemBuilder: itemBuilder, separatorBuilder: (), itemCount: ))
          ],
        ),
      ),
    );
  }
}
