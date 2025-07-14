import 'package:flutter/material.dart';
import 'package:movies_app/data/entity/movies.dart';
import 'package:movies_app/ui/views/detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    Future<List<Movies>> moviesDownload() async {
      var moviesList = <Movies>[];
      var f1 = Movies(id: 1, name: "Django", image: "django.png", price: 24);
      var f2 = Movies(id: 2, name: "Interstellar", image: "interstellar.png", price: 32);
      var f3 = Movies(id: 3, name: "Inception", image: "inception.png", price: 16);
      var f4 = Movies(id: 4, name: "The Hateful Eight", image: "thehatefuleight.png", price: 28);
      var f5 = Movies(id: 5, name: "The Pianist", image: "thepianist.png", price: 18);
      var f6 = Movies(id: 6, name: "Anadoluda", image: "anadoluda.png", price: 10);
      moviesList.add(f1);
      moviesList.add(f2);
      moviesList.add(f3);
      moviesList.add(f4);
      moviesList.add(f5);
      moviesList.add(f6);
      return moviesList;
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Detay Sayfa"),),
      body: FutureBuilder<List<Movies>>(
        future: moviesDownload(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            var moviesList=snapshot.data;
            return GridView.builder(
              itemCount: moviesList!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1/1.8
              ),
              itemBuilder: (context, indeks){
                var movie=moviesList[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(movie: movie)));
                  },
                  child: Card(
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("images/${movie.image}"),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${movie.price}₺",style: const TextStyle(fontSize: 24),),
                            ElevatedButton(onPressed: (){
                              print("${movie.name} sepete eklendi.");
                            }, child: const Text("Sepet"))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
                  
              },
            );
          }else{
            return const Center();
          }
        },
      ),
    );

  }
}
