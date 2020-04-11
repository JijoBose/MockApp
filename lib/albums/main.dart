import 'dart:convert';
import 'package:mockapp/API.dart';
import 'package:mockapp/models/Album.dart';
import 'package:flutter/material.dart';

class AlbumPage extends StatefulWidget {
  AlbumPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  var albums = new List<Album>();

  _getAlbums() {
    API.getAlbums().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        albums = list.map((model) => Album.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getAlbums();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    listGrid(numbers) {
      return Center(
        // padding: const EdgeInsets.all(8),
        child: Text('Album $numbers'),
        // color: Colors.teal[100],
      );
    }

    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: List.generate(albums.length, (index) {
        return listGrid(index);
      })
    );
  }
}
