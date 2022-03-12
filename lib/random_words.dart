import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'dart:math';
// ignore: import_of_legacy_library_into_null_safe
class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _savedWordPairs = Set<WordPair>();

  void _pushedSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair pair){
            return ListTile(
              title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0))
            );
          });

          final List<Widget> divided = ListTile.divideTiles(context: context, tiles: tiles).toList();
          return Scaffold(
            appBar:  AppBar(
              title: Text('Saved WordPairs')
            ),
            body: ListView(children: divided)
          );
        }

        
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Victor Name Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushedSaved)
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(100)); /*4*/
          }
          final alreadySaved = _savedWordPairs.contains(_suggestions[index]);
          return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
              style: _biggerFont,
            ),
            trailing: Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null),
            onTap: () {
              setState(() {
                if (alreadySaved) {
                  _savedWordPairs.remove(_suggestions[index]);
                } else {
                  _savedWordPairs.add(_suggestions[index]);
                }
              });
            },
          );
        },
      ),
    );
  }
}
