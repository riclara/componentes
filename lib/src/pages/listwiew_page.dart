import 'dart:async';

import 'package:flutter/material.dart';

class ListviewPage extends StatefulWidget {
  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  ScrollController _scrollController = ScrollController();
  List<int> _numberList = List();
  int _page = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addTeen();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _addTeen();
        _fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(children: <Widget>[
        _crearLista(),
        _createLoading()
      ]),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _getPageOne,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numberList.length,
        itemBuilder: ( BuildContext context, int index ) {
          final int id = _numberList[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$id'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> _getPageOne() async{
    final duration = Duration( seconds:  2 );
    return Future.delayed(duration, () {
      _numberList.clear();
      _page++;
      _addTeen();
    });
  }

  Widget _createLoading() {
    if(_isLoading) {
      return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator()
              ],
            ),
            SizedBox( height: 15.0, )
          ],
        );
    } else {
      return Container();
    }

  }

  void _addTeen() {
    for (var i = 1; i < 10; i++) {
      _page++;
      _numberList.add(_page);
      setState(() {
        
      });
    }
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    final duration = Duration( seconds: 2 );
    Timer(duration, () {
      _isLoading = false;
      _addTeen();
      _scrollController.animateTo(
        _scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn,
        duration: Duration( milliseconds: 250 )
      );
    });

  }
}