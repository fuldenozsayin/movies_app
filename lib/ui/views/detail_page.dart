import 'package:flutter/material.dart';
import 'package:movies_app/data/entity/movies.dart';

class DetailPage extends StatefulWidget {
  Movies movie;
  DetailPage({required this.movie});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.movie.name),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.movie.image}"),
            Text("${widget.movie.price}₺", style: const TextStyle(fontSize: 50),),
          ],

        ),
      ),
    );
  }
}
