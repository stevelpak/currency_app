import 'package:currency/models/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:currency/utils/constants.dart';
import 'package:flutter_svg/svg.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage(this._listCurrency, this.topCur, this.bottomCur,
      {Key? key})
      : super(key: key);
  final List<CurrencyModel> _listCurrency;
  final String topCur;
  final String bottomCur;

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  final List<CurrencyModel> _filterList = [];
  final TextEditingController _editingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _filterList.addAll(widget._listCurrency);
  }

  @override
  void dispose() {
    super.dispose();
    _editingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff1f2235),
        title: TextField(
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
            hintStyle: kTextStyle(
                color: Colors.white54, size: 16, fontWeight: FontWeight.w500),
            suffixIcon: IconButton(
                onPressed: () {
                  _editingController.clear();
                  setState(() {
                    _filterList.clear();
                    _filterList.addAll(widget._listCurrency);
                  });
                },
                icon: const Icon(Icons.clear, color: Colors.white, size: 20)),
          ),
          style: kTextStyle(size: 16, fontWeight: FontWeight.w500),
          onChanged: (value) {
            _filterList.clear();
            if (value.isNotEmpty) {
              for (final item in widget._listCurrency) {
                if (item.ccy!.toLowerCase().contains(value.toLowerCase()) ||
                    item.ccyNmEn!.toLowerCase().contains(value.toLowerCase())) {
                  _filterList.add(item);
                }
              }
            } else {
              _filterList.addAll(widget._listCurrency);
            }
            setState(() {});
          },
        ),
      ),
      backgroundColor: const Color(0xff1f2235),
      body: ListView.separated(
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            var model = widget._listCurrency[index];
            bool isChoosen =
                widget.topCur == model.ccy || widget.bottomCur == model.ccy;

            return ListTile(
              tileColor: const Color(0xff2d334d),
              onTap: () {
                if (isChoosen) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Is has been choosen!!!',
                        style: kTextStyle(fontWeight: FontWeight.w100),
                      ),
                    ),
                  );
                } else {
                  Navigator.pop(context, model);
                }
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(27.5),
                child: SvgPicture.asset(
                  'assets/flags/${model.ccy?.substring(0, 2).toLowerCase()}.svg',
                  height: 45,
                  width: 45,
                ),
              ),
              title: Text(
                model.ccyNmEn ?? '',
                style: kTextStyle(size: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                model.ccyNmEn ?? '',
                style: kTextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: Text(
                model.rate ?? '',
                style: kTextStyle(size: 16, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: isChoosen
                      ? const BorderSide(color: Color(0xff10a4d4), width: 2)
                      : BorderSide.none),
            );
          }),
          separatorBuilder: ((context, index) => const SizedBox(
                height: 10,
              )),
          itemCount: _filterList.length),
    );
  }
}
