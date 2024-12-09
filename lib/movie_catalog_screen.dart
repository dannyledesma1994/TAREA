import 'package:flutter/material.dart';
import 'movie_player_screen.dart'; // Importa la pantalla de reproducción de películas

class Movie {
  final String title;
  final String description;
  final String imageUrl;

  Movie({required this.title, required this.description, required this.imageUrl});
}

class MovieCatalogScreen extends StatelessWidget {
  final List<Movie> popularMovies = [
    Movie(
      title: 'Inception',
      description: 'Un ladrón experto manipula los sueños para robar secretos.',
      imageUrl: 'https://media.giphy.com/media/26vUw5fpLHkU9oSEs/giphy.gif',
    ),
    Movie(
      title: 'The Dark Knight',
      description: 'El caballero oscuro enfrenta al caos que amenaza Gotham.',
      imageUrl: 'https://media.giphy.com/media/l3vR4Fp4giSwJKPcU/giphy.gif',
    ),
  ];

  final List<Movie> trendingMovies = [
    Movie(
      title: 'The Big Short',
      description: 'Un grupo de inversores apuesta contra el colapso del mercado hipotecario.',
      imageUrl: 'https://media.giphy.com/media/26xBC3XX9ppD4vWDG/giphy.gif',
    ),
    Movie(
      title: 'Interstellar',
      description: 'Un grupo de astronautas viaja a través de un agujero de gusano en busca de un nuevo hogar para la humanidad.',
      imageUrl: 'https://media.giphy.com/media/3o7abKhOpu0NwenH3O/giphy.gif',
    ),
  ];

  final List<Movie> newArrivals = [
    Movie(
      title: 'Tenet',
      description: 'Un espía debe manipular el flujo del tiempo para evitar una catástrofe mundial.',
      imageUrl: 'https://media.giphy.com/media/3o7abKhOpu0NwenH3O/giphy.gif',
    ),
    Movie(
      title: 'Dune',
      description: 'La historia épica de un joven luchador por salvar su casa y su planeta.',
      imageUrl: 'https://media.giphy.com/media/26n7b7PjSOZJwVCmY/giphy.gif',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Catálogo de Películas', style: TextStyle(color: Colors.white)),
        elevation: 8,
        shadowColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF3A1C71), Color(0xFFD76D77), Color(0xFFFFAF7B)], // Fondo dinámico
          ),
        ),
        child: ListView(
          children: [
            _buildMovieCategory('Populares', popularMovies, context),
            _buildMovieCategory('Tendencias', trendingMovies, context),
            _buildMovieCategory('Nuevas Llegadas', newArrivals, context),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieCategory(String category, List<Movie> movies, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(offset: Offset(2, 2), blurRadius: 4, color: Colors.black54),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return _buildMovieCard(movies[index], context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieCard(Movie movie, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoviePlayerScreen(movie: movie),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(movie.imageUrl),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(4, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(offset: Offset(1, 1), blurRadius: 4, color: Colors.black87),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
