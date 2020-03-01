import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged onSearch;

  SearchBar({@required this.onSearch});

  @override
  _SearchBarState createState() => _SearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  final _deBouncer = Debouncer<String>(Duration(milliseconds: 200));

  @override
  void initState() {
    super.initState();
    _deBouncer.values.listen((search) => widget.onSearch(search));
  }

  @override
  void dispose() {
    super.dispose();
    _deBouncer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 16.0),
      child: Container(
        height: 46.0,
        width: double.infinity,
        child: CupertinoTextField(
          controller: _controller,
          keyboardType: TextInputType.text,
          placeholder: '输入你想知道的',
          placeholderStyle: TextStyle(
            color: Color(0xffC4C6CC),
            fontSize: 14.0,
            fontFamily: 'Brutal',
          ),
          onChanged: (text) {
            _deBouncer.value = text;
          },
          prefix: Padding(
            padding: const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
            child: Icon(
              Icons.search,
              color: Color(0xffC4C6CC),
            ),
          ),
          suffix: Padding(
            padding: const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
            child: InkWell(
              onTap: () {
                _controller.clear();
              },
              child: Icon(
                Icons.clear,
                color: Color(0xffC4C6CC),
              ),
            ),
          ),
          suffixMode: OverlayVisibilityMode.editing,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Color(0xffF0F1F5),
          ),
        ),
      ),
    );
  }
}