import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/entity/movies.dart';
import 'package:movies_app/ui/cubit/home_page_cubit.dart';
import 'package:movies_app/ui/views/detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().moviesDownload();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Movies"),),
      body: BlocBuilder<HomePageCubit,List<Movies>>(
        builder: (context, moviesList){
          if(moviesList.isNotEmpty){
            return GridView.builder(
              itemCount: moviesList.length,
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
                              print("${movie.name} added to cart.");
                            }, child: const Text("Basket"))
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
